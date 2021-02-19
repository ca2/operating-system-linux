#pragma once


#include "aura/_.h"
#include "aura/user/_user.h"
#include "aura/os/linux/appindicator.h"
#include "acme/os/ansios/_pthread.h"
#include "acme/os/linux/_user.h"

#define WITH_XI
#define WITH_SN

//#include <gtk/gtk.h>
//#include <gdk/gdkx.h>


#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/extensions/Xrender.h>
#include <X11/Xatom.h>


#if defined(_WINDOWING_X11_LIBRARY)
   #define CLASS_DECL_WINDOWING_X11  CLASS_DECL_EXPORT
#else
   #define CLASS_DECL_WINDOWING_X11  CLASS_DECL_IMPORT
#endif


namespace windowing_x11
{


   class windowing;
   class display;
   class window;
   class x11data;


} // namespace node_gnome


//namespace user
//{
//
//   char * gsettings_get_malloc(const char * pszSchema, const char * pszKey);
//
//
//}


//#include "node.h"


//#include "copydesk.h"


#include "buffer.h"


#include "cursor.h"


#include "icon.h"


#include "window.h"


#include "windowing.h"


#include "display.h"


#include "display_lock.h"


#include "factory_exchange.h"



