// created by Camilo <3CamiloSasukeThomasBorregaardSoerensen
// recreated by Camilo 2021-01-28 22:42 <3TBS, Mummi and bilbo!!
// hi5 contribution...
#include "framework.h"
#if !BROAD_PRECOMPILED_HEADER
#include "aura/user/_user.h"
#endif
#include "_user.h"

//#define VERI_BASIC_TEST

namespace xlib
{


   buffer::buffer()
   {

      m_gc = nullptr;

//      m_pimage = nullptr;

      m_iGoodStride = 0;

   }


   buffer::~buffer()
   {

      destroy_os_buffer();

   }


   ::e_status buffer::initialize_graphics_graphics(::user::interaction_impl * pimpl)
   {

      auto estatus = double_buffer::initialize_graphics_graphics(pimpl);

      if(!estatus)
      {

         return estatus;

      }

      sync_lock sl(mutex());

      xdisplay d(m_oswindow->display());

      XGCValues gcvalues = {};

      m_gc = XCreateGC(m_oswindow->display(), m_oswindow->window(), 0, &gcvalues);

      return estatus;

   }


   void buffer::finalize()
   {

      sync_lock sl(mutex());

      xdisplay d(m_oswindow->display());

      if(m_gc != nullptr)
      {

         XFreeGC(m_oswindow->display(), m_gc);

         m_gc = nullptr;

      }


   }


   bool buffer::create_os_buffer(const ::size & size, int iStrideParam)
   {

//      sync_lock sl(mutex());
//
//      destroy_os_buffer();
//
//      if(size.is_empty())
//      {
//
//         return false;
//
//      }
//
//      //m_mem.m_bAligned = true;
//
//      m_mem.set_size((m_iGoodStride * size.cy) * sizeof(color32_t));
//
//      m_pixmap.init(size, (color32_t *) m_mem.get_data(), m_iGoodStride);
//
//      //::acme::del(m_pdc);
//
//      {
//
//         xdisplay d(m_oswindow->display());
//
//         m_pimage = XCreateImage(d, m_oswindow->visual(), m_oswindow->m_iDepth, ZPixmap, 0, (char *) m_mem->get_data(), m_pixmap->width(), m_pixmap->height(), sizeof(color32_t) * 8, m_iGoodStride);
//
//         XGCValues gcvalues;
//
//   //      m_pdc = new device_context();
//
//         m_gc = XCreateGC(d, m_oswindow->window(), 0, &gcvalues);
//
//      }
//
//      //m_pdc->m_pdisplay = m_pimpl->m_oswindow->display();
//
      return true;

   }



   void buffer::destroy_os_buffer()
   {

//      sync_lock sl(mutex());
//
//      xdisplay d(m_oswindow->display());
//
//      //if(m_pdc != nullptr)
//      {
//
//         //if(m_pdc->m_gc != nullptr)
//         if(m_gc != nullptr)
//         {
//
//            XFreeGC(d, m_gc);
//
//            m_gc = nullptr;
//
//         }
//
//         //delete m_pdc;
//
//         //m_pdc = nullptr;
//
//      }
//
//      if(m_pimage != nullptr)
//      {
//
//         if(m_mem.get_data() == (byte *) m_pimage->data)
//         {
//
//            m_pimage->data = nullptr;
//
//         }
//
//         XDestroyImage(m_pimage);
//
//         m_pimage = nullptr;
//
//      }
//
   }


//   bool buffer::create_os_buffer(::image * pimage)
//   {
//
//      //sync_lock sl(mutex());
//
////      if(!pimage)
////      {
////
////         return false;
////
////      }
////
////      m_pixmap.init(pimage->size(), (color32_t *) pimage->get_data(), pimage->scan_size());
////
////      {
////
////         //xdisplay d(m_oswindow->display());
////
////         m_pimage =
////            XCreateImage(
////               m_oswindow->display(),
////               m_oswindow->visual(),
////               m_oswindow->m_iDepth,
////               ZPixmap,
////               0,
////               (char *) pimage->get_data(),
////               pimage->width(),
////               pimage->height(),
////               sizeof(color32_t) * 8,
////               pimage->scan_size());
////
////      }
//
//      return true;
//
//   }


//   void buffer::destroy_os_buffer(::image * pimage)
//   {
//
//      if(m_pimage != nullptr)
//      {
//
//         if((byte *) m_pimage->data == (byte *) pimage->get_data())
//         {
//
//            m_pimage->data = nullptr;
//
//         }
//
//         XDestroyImage(m_pimage);
//
//         m_pimage = nullptr;
//
//      }
//
//   }
//

   bool buffer::buffer_lock_round_swap_key_buffers()
   {

      bool bOk1 = double_buffer::buffer_lock_round_swap_key_buffers();

      bool bOk2 = bitmap_source_buffer::buffer_lock_round_swap_key_buffers();

      return bOk1 && bOk2;

   }




   bool buffer::update_window(void)
   {

      if(m_pimpl == nullptr)
      {

         return false;

      }

      if(m_pimpl->m_oswindow == nullptr)
      {

         return false;

      }

      string strType = m_pimpl->m_puserinteraction->type_c_str();

      bool bComboList = strType.contains_ci("combo_list");

      if(bComboList)
      {

         //output_debug_string("combo_list update_window");

      }

      if(!m_pimpl->m_puserinteraction->is_window_screen_visible())
      {

         bool bReallyNotVisible = !(m_pimpl->m_puserinteraction->GetStyle() & WS_VISIBLE);

         INFO("XPutImage not called. Ui is not visible.");

         return false;

      }

      if(m_oswindow == nullptr)
      {

         return false;

      }

      sync_lock slGraphics(mutex());

      if(m_gc == nullptr)
      {

         return false;

      }

      auto psync = get_screen_sync();

      sync_lock sl(psync);

      auto & pimage = get_screen_image();

      if(!pimage)
      {

         return false;

      }

      slGraphics.unlock();

      pimage->map();

      xdisplay d(m_oswindow->display());

      //XImage * pximage = (XImage *)pimage->payload("pximage").i64();

      XImage * pximage;

      //if(!pximage)
      {

         color32_t colora[8];

         memcpy(colora, pimage->get_data(), sizeof(colora));

         int iDefaultDepth = DefaultDepth(m_oswindow->display(), m_oswindow->m_iScreen);

         int iWindowDepth = m_oswindow->m_iDepth;

         pximage =
            XCreateImage(
               m_oswindow->display(),
               m_oswindow->visual(),
               iWindowDepth,
               ZPixmap,
               0,
               (char *) pimage->get_data(),
               pimage->width(),
               pimage->height(),
               sizeof(color32_t) * 8,
               pimage->scan_size());

         //pimage->payload("pximage") = (::i64) pximage;

      }

      //printf("pimage (%d, %d, %d)\n", pimage->width(), pimage->height(), pimage->get_pixel(100, 600));

      if(!pximage || pximage->width <= 0 || pximage->height <= 0)
      {

         return false;

      }

      try
      {

         //XGCValues gcvalues = {};

//       auto gc = XCreateGC(m_oswindow->display(), m_oswindow->window(), 0, &gcvalues);

         int iWidth = pximage->width;

         int iHeight = pximage->height;

         //if(!bComboList)
         //{

            XPutImage(m_oswindow->display(), m_oswindow->window(), m_gc, pximage, 0, 0, 0, 0, iWidth, iHeight);

         //}

  //     XFreeGC(m_oswindow->display(), gc);

//         if(bComboList)
//         {
//
//            XColor xcolour;
//
//            // I guess XParseColor will work here
//
//            xcolour.red = 32000;
//
//            xcolour.green = 65000;
//
//            xcolour.blue = 32000;
//
//            xcolour.flags = DoRed | DoGreen | DoBlue;
//
//            XAllocColor(m_oswindow->display(), m_oswindow->m_colormap, &xcolour);
//
//            XSetForeground(m_oswindow->display(), m_gc, xcolour.pixel);
//
//            XFillRectangle(m_oswindow->display(), m_oswindow->window(), m_gc, 0, 0, iWidth, iHeight);
//
//         }

         #ifdef VERI_BASIC_TEST

         XColor xcolour;

         // I guess XParseColor will work here

         xcolour.red = 32000; xcolour.green = 65000; xcolour.blue = 32000;

         xcolour.flags = DoRed | DoGreen | DoBlue;

         XAllocColor(m_oswindow->display(), m_oswindow->m_colormap, &xcolour);

         XSetForeground(m_oswindow->display(), m_gc, xcolour.pixel);

         XFillRectangle(m_oswindow->display(), m_oswindow->window(), m_gc, 0, 0, iWidth, iHeight);

         #endif

      }
      catch(...)
      {

      }

      pximage->data = nullptr;

      XDestroyImage(pximage);

      if(m_pimpl->m_puserinteraction->m_ewindowflag & e_window_flag_arbitrary_positioning)
      {

         //XFlush(m_oswindow->display());

         //XSync(m_oswindow->display(), false);

      }

      return true;

   }


   bool buffer::update_window(::image * pimage)
   {

      throw("use update_window(void)");

      return true;

   }


   ::draw2d::graphics * buffer::on_begin_draw()
   {

      m_iGoodStride = max(m_iGoodStride, window_size().cx);

      bitmap_source_buffer::on_begin_draw();

      return double_buffer::on_begin_draw();

   }


} // namespace xlib




