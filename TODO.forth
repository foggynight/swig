- Structs?
- Addresses?
- Names?

## Bernd's requests:

# N-5
Derzeitiges Ergebnis: Ne, geht so nicht. Definitiv besonders blöd: Wayland. Da 
musste relativ viel von Hand nachgearbeitet werden, damit es überhaupt 
funktioniert, und das ist mit so einer Automatik nicht drin.

Also, bitte: Den Prefix/Postfix abschaltbar machen.

# N-4
> Danke fürs Testen, werds mal abschaltbar machen und dann schauen dass wir
> wayland und co noch zum laufen bringen. Sehe nicht das etwas dagegen
> spricht automatisch auch ein vocabulary zu machen, aber das werde ich dann
> auch gleich abschaltbar machen.

Ungefähr so:

#define SWIG_FORTH_OPTIONS "no-prefix"

# N-3
Und eine Flag, ob das Vokabular case-sensitive (CS-VOCABULARY) oder normal 
sein soll. CS-VOCABULARY ist der sinnvolle Default, C ist halt case-sensitiv.

# N-2
Noch einen Wunsch: Androids .so-Loader ist so dämlich, dass er abhängige 
Libraries nicht mitzieht (so man die als Anwendung selbst mitbringt — das ist 
ein generelles ld.so-Problem). Deshalb steht in den ganzen Dateien so Zeugs 
drin wie

e? os-type s" linux-android" string-prefix? [IF]
    s" libsoil.so" also c-lib open-path-lib drop previous
[THEN]

Ich bin da gerade dabei, ein deferred word PREFETCH-LIB in die libcc.fs 
einzubauen, mit der man das schmerzfrei machen kann — man muss der *nur* den 
Namen der Library übergeben. Also etwa

s" libsoil.so" prefetch-lib

Diese Library muss man halt dann auch im .i-File mit einem Special-Define 
definieren, dann kann man tatsächlich vollwertige Libraries automatisch 
erzeugen.


# N-1
Nächster Wunsch: Das add-library ist auch nicht immer sinnvoll, denn manche
Libraries werden automatisch gelinkt (libc, oder auf Android auch die libjni).
Und die libjni ist bei Android gar nicht auf dem Build-System vorhanden, d.h.
man kann dort nicht linken. Das ist zwar alles krank (und ich hätte den Leuten
dort gesagt, dass sie halt den ld.so-Loader richtig hinkriegen sollen, so wie
unter Linux auch), aber Android-SNAFU halt. Externe Sachen einbinden ist immer
SNAFU.

Ich denke, Factoring würde dem Code, den du jetzt hast, auch gut tun. Das
Einfügen der \c #include <file> in eine eigene Funktion, und für jede andere
Zeile auch eine eigene Funktion, dann kann man die auch schön der Reihe nach
an- und abschalten.

# N
Noch ein Feature-Request: Es gibt da diese ptr-declare-Sache, die ich benutze, 
um JNI zu fixen. So eine Pointer-Deklaration sieht so aus, kann theoretisch 
mehrere davon geben (in der Praxis habe ich bis jetzt nur eine gesehen):

s" ((struct JNI:*(Cell*)(x.spx[arg0])" ptr-declare $+[]!

Da das in jni vorkommt, löse ich das derzeit schön unelegant, indem ich die 
addlib-Zeile, die ja auf Android überflüssig ist, durch diese ptr-declare-
Zeile ersetze.

Syntax ist jeweils ein Pattern, dann ein : und dann, wie man an den Pointer 
kommt, den man für den OOP-Aufruf braucht. Der ; darf auch nicht vorkommen; 
wenn dir das zu mühsam ist, das in mehrere Zeilen aufzubrechen, mache ich ein 
Wort PTR-DECLARE!, das den übergebenen String an den Strichpunkten aufbricht, 
und jeweils den Teilstring zu PTR-DECLARE dazufügt.

Weil's aber relativ oft einfach nur darum geht, irgendwelchen sehr 
spezifischen Fix-Müll unterzubringen, wäre es für so Sonderfälle wohl schon 
ausreichend, wenn einfach ein well-known-String am Ende der Präambel als 
Kommentar eingetragen wird. Den kann ich dann mit SED oder AWK suchen und 
ersetzen, fertig.


