#pragma once


#define _THREAD_SAFE


#define PARALLELIZATION_PTHREAD


#define ENABLE_BINRELOC

#ifndef LINUX
#define LINUX
#endif

#ifndef _LINUX
#define _LINUX
#endif


#ifdef RASPBIAN
#pragma pack(4)
#endif


#define c_cdecl


#define BROAD_PRECOMPILED_HEADER 1

#ifndef __linux__
#define __linux__
#endif

#define _OPENGL 1

#define HAVE_TERMIOS_H 1


#define _FILE_OFFSET_BITS 64


#define BSD_STYLE_SOCKETS
#define HAVE_MYSQL 1
#define HAVE_OPENSSL 1

#define VARIADIC_TEMPLATE_FORMAT2

#define HAVE_PTHREAD_MUTEX_TIMEDLOCK 1

#define OPENSSL_API_COMPAT 0x10100000L


#define CLASS_DECL_EXPORT
#define CLASS_DECL_IMPORT
#define CLASS_DECL_THREAD __thread
#define __FACTORY_EXPORT extern "C"
#define __FACTORY_IMPORT extern "C"



#define OPERATING_SYSTEM_NAME   	"linux"
#define OPERATING_SYSTEM_NAMESPACE	linux






#ifdef cplus
#define inline static
#endif

#define static_inline static inline



#ifdef __cplusplus

#define LOG_THIS_TAG (get_demangle(type_name()))
#define LOG_MEMBER_PREFIX __FUNCTION__

#define ALOG_FUNCTION __FUNCTION__
#define ALOG_LINE __LINE__
#define ALOG_FILE __FILE__


#include <initializer_list>

#endif



#define AXIS_FREEIMAGE






#define _strdup strdup


#define HNULL 0
#define STR_NEWLINE "\n"


//#include "bit.h"



#define FONT_SANS "sans-serif"
#define FONT_SERIF "serif"
#define FONT_SANS_EX "sans-serif"
#define FONT_SERIF_EX "serif"
#define FONT_SANS_FX "sans-serif"
#define FONT_SERIF_FX "serif"
#define FONT_SANS_UI "sans-serif"
#define FONT_SERIF_UI "serif"


#define FONT_MONO "monospace"


