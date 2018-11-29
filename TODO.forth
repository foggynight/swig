- Structs?
- Addresses?
- Names?

## Bernd's requests:

[ ] disable pre-&postfix, like to: `#define SWIG_FORTH_OPTIONS "no-prefix"`
[ ] case-sensitive vocabulary (CS-VOCABULARY): new default in gforth.swg?
[ ] prefetch-lib (overwrite default add-library)
    current:
        e? os-type s" linux-android" string-prefix? [IF]
            s" libsoil.so" also c-lib open-path-lib drop previous
        [THEN]
    future:
        s" libsoil.so" prefetch-lib
[ ] generate swigPre/PostFixPrint for better readability/bug-hunting in c-files
    \c #include <file> in separate function call
[ ] Well known string at borders of *amble (i.e. ---<preamble?>---)
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


