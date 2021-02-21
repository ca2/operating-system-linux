// created by Camilo <3CamiloSasukeThomasBorregaardSoerensen
// recreated by Camilo 2021-01-28 22:35 <3TBS, Mummi and bilbo!!
// hi5 contribution...
#pragma once


namespace windowing_x11
{


   class CLASS_DECL_WINDOWING_X11 windowing :
      virtual public ::windowing::windowing
   {
   public:


      __pointer(::windowing_x11::display)        m_pdisplay;
      void *                                          m_pSnLauncheeContext;

#ifdef WITH_XI

      int                                             m_xi_opcode = -1;
      __pointer(object_array)                         m_pobjectaExtendedEventListener;

#endif



      windowing();
      virtual ~windowing();


      virtual ::e_status initialize(::layered * pobjectContext) override;


      virtual bool initialize_windowing();

      virtual bool terminate_windowing();

      virtual bool post_ui_message(const MESSAGE & message);

      virtual ::e_status start() override;

      virtual void _libsn_start_context()  override;
      virtual ::windowing::display * display() override;

      virtual void windowing_main() override;

      virtual void x11_main();

      //virtual HCURSOR load_default_cursor(e_cursor ecursor) override;
      virtual __pointer(::windowing::cursor) load_default_cursor(enum_cursor ecursor);

      //virtual int_bool window_set_mouse_cursor(window * pwindow, HCURSOR hcursor) override;

      //virtual bool set_window_icon(window * pwindow, const ::file::path & path) override;

      //virtual ::windowing::window * new_message_window(::user::interaction_impl * pimpl) override;

      virtual ::windowing::window * new_window(::user::interaction_impl * pimpl) override;

      virtual ::e_status remove_window(::windowing::window * pwindow) override;

      virtual ::windowing_x11::window * _window(Window window);


      virtual void _message_handler(void * p);

//      SnLauncheeContext* g_psncontext = nullptr;

      //void x_display_error_trap_push(SnDisplay * sndisplay, Display * display);

      //void x_display_error_trap_pop(SnDisplay * sndisplay, Display * display);
      //void x_display_error_trap_pop(SnDisplay * sndisplay, Display * display);


      virtual ::windowing::window * get_active_window(::thread * pthread) override;

      virtual ::windowing::window * get_keyboard_focus(::thread * pthread) override;


      //virtual ::e_status clear_active_window(::thread * pthread);

      virtual bool x11_on_event(XEvent * pevent);

      virtual bool x11_message_handler(XEvent * pevent);

      //virtual bool __x11_hook_process_event(XEvent * pevent, XGenericEventCookie * cookie);

      //virtual bool __x11_hook_list_is_empty();

      virtual bool x11_message_loop_step();

      virtual ::windowing::window * window(oswindow oswindow) override;

      //virtual void _libsn_start_context() override;

#ifdef WITH_XI

      void x11_register_extended_event_listener(::matter * pdata, bool bMouse, bool bKeyboard);
      bool x11_process_event(XEvent * pevent, XGenericEventCookie *cookie);

#else

      bool x11_process_event(Display * pdisplay, XEvent * pevent);

#endif


   };


} // namespace windowing



