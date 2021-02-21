// created by Camilo <3CamiloSasukeThomasBorregaardSoerensen
// recreated by Camilo 2021-01-28 22:35 <3TBS, Mummi and bilbo!!
// hi5 contribution...
#include "framework.h"
#include "windowing_x11.h"
#include <X11/cursorfont.h>


namespace windowing_x11
{


   windowing::windowing()
   {

      defer_initialize_x11();

      set_layer(LAYERED_X11, this);

   }


   windowing::~windowing()
   {


   }


   ::windowing::window * windowing::new_window(::user::interaction_impl * pimpl)
   {

      __pointer(::windowing_x11::window) pwindow = __create < ::windowing::window >();

      if(!pwindow)
      {

         return nullptr;

      }

      pwindow->m_pwindowing = this;

      pwindow->m_pimpl = pimpl;

      pwindow->create_window(pimpl);

      return pwindow;

   }


    ::e_status windowing::remove_window(::windowing::window * pwindow)
   {

      return m_pdisplay->remove_window(pwindow);

   }


   ::e_status windowing::initialize(::layered *pobjectContext)
   {

      auto estatus = ::windowing::windowing::initialize(pobjectContext);

      if(!estatus)
      {

         return estatus;

      }

      initialize_windowing();

      auto pdisplay = __create < ::windowing::display >();

      if(!pdisplay)
      {

         return pdisplay.status();

      }

      m_pdisplay = pdisplay;

      if(!pdisplay)
      {

         return error_no_interface;

      }

      estatus = m_pdisplay->open();

      if(!estatus)
      {

         return estatus;

      }

      return ::success;

   }


   ::e_status windowing::start()
   {

      if (System.m_bUser)
      {

         defer_initialize_x11();

      }

      auto pnode = Node;

      if(pnode)
      {

         _libsn_start_context();

         pnode->start();

      }
      else
      {

         x11_main();

      }

      return ::success;

   }


   ::windowing::display * windowing::display()
   {

      return m_pdisplay;

   }


   ::windowing_x11::window * windowing::_window(Window window)
   {

      if (!m_pdisplay)
      {

         return nullptr;

      }

      auto pwindow = m_pdisplay->_window(window);

      return pwindow;

   }


   __pointer(::windowing::cursor) windowing::load_default_cursor(enum_cursor ecursor)
   {

      synchronization_lock synchronizationlock(mutex());

      if (m_pcursorset.is_null())
      {

         auto estatus = __construct_new(m_pcursorset);

         if (!estatus)
         {

            return nullptr;

         }

      }

      auto & pcursor = m_pcursorset->m_cursormap[ecursor];

      if(pcursor)
      {

         return pcursor;

      }

      int iCursor = 0;

      if(ecursor == e_cursor_size_top_left)
      {

         iCursor = XC_top_left_corner;

      }
      else if(ecursor == e_cursor_size_top_right)
      {

         iCursor = XC_top_right_corner;

      }
      else if(ecursor == e_cursor_size_top)
      {

         iCursor = XC_top_side;

      }
      else if(ecursor == e_cursor_size_right)
      {

         iCursor = XC_right_side;

      }
      else if(ecursor == e_cursor_size_left)
      {

         iCursor = XC_left_side;

      }
      else if(ecursor == e_cursor_size_bottom)
      {

         iCursor = XC_bottom_side;

      }
      else if(ecursor == e_cursor_size_bottom_left)
      {

         iCursor = XC_bottom_left_corner;

      }
      else if(ecursor == e_cursor_size_bottom_right)
      {

         iCursor = XC_bottom_right_corner;

      }
      else if(ecursor == e_cursor_arrow)
      {

         iCursor = XC_arrow;

      }

      if(iCursor == 0)
      {

         return nullptr;

      }

      synchronization_lock sl(x11_mutex());

      windowing_output_debug_string("\n::x11_GetWindowRect 1");

      display_lock lock(m_pdisplay);

      auto cursor = XCreateFontCursor(m_pdisplay->Display(), iCursor);

      auto pcursorX11 = __create < ::windowing_x11::cursor >();

      pcursor = pcursorX11;

      pcursorX11->m_cursor = cursor;

      return pcursor;

   }


   void windowing::_message_handler(void * p)
   {

      XEvent * pevent = (XEvent *) p;

   }


   ::windowing::window * windowing::get_keyboard_focus(::thread *)
   {

      if(!m_pdisplay)
      {

         return nullptr;

      }

      synchronization_lock synchronizationlock(x11_mutex());

      display_lock lock(m_pdisplay);

      auto pwindow = m_pdisplay->get_keyboard_focus();

      return pwindow;

   }


   ::windowing::window * windowing::window(oswindow oswindow)
   {

      return oswindow;

   }


} // namespace windowing



