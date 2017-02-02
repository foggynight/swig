/*
 *	Swig Example File
 * */

//#include <sys/types.h>
//#include <unistd.h>
//
#define theAnswer 42
#define negativeHalfAnswer -21
#define aStatement "forth rocks"
#define aFloatingPoint 1.23
#define aNull NULL

/* case 1: standalone struct and typedef */
struct vec2 {
	int x;
	int y;
};

typedef struct vec2 VEC2;

/* case 2: direct typedef struct */
typedef struct {
	int x;
	int y;
	int z;
} VEC3;

/* case 3: standalone struct */
struct VEC4 {
    float x;
    float y;
    float z;
    int   w;
};

enum DAYS{ MONDAY=1, TUESDAY, WEDNESDAY=10, THURSDAY };

extern char getChar( void );
extern char*getCharP( void );

extern float getFloat( void );
extern float*getFloatP( void );

extern char *manipulateString( char *one, char*two );

extern int getInt( void );
extern int getIntIndex( int index );

extern int getVec2X( VEC2 v2 );
extern int getVec3Y( VEC3 v3 );
extern int getVec4Z( struct VEC4 v4 );
