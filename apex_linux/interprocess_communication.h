// created by Camilo 2021-02-14 16:56 BRT <3CamiloSasukeThomasBorregaardSoerensen
#pragma once


namespace linux
{


   class CLASS_DECL_APEX interprocess_communication_base :
      virtual public interprocess_communication::base
   {
   public:

#ifdef _UWP

      //i32              m_iSerial;

#elif defined(WINDOWS_DESKTOP)


      //HWND             m_hwnd;

      //m_osdataa[0] == = HWND;


#elif defined(APPLEOS)


      CFMessagePortRef     m_port;


#elif !defined(_UWP)

      key_t                m_key;
      int                  m_iQueue;

      struct data_struct
      {


         long     mtype;
         long     request;
         int      size;
         char     data[0];


      };


#endif


      string   m_strBaseChannel;


      interprocess_communication_base();
      ~interprocess_communication_base() override;


   };


   class CLASS_DECL_APEX interprocess_communication_tx :
      virtual public interprocess_communication_base,
      virtual public interprocess_communication::tx
   {
   public:


      interprocess_communication_tx();
      ~interprocess_communication_tx() override;


      bool open(const ::string & pszChannel, launcher * plauncher = nullptr);
      bool close();


      bool send(const ::string & pszMessage, duration durationTimeout);
      bool send(int message, void * pdata, int len, duration durationTimeout);


      bool is_tx_ok();

   };


   class rx_private;


   class CLASS_DECL_APEX interprocess_communication_rx :
      virtual public interprocess_communication_base,
      virtual public interprocess_communication::rx
   {
   public:


      interprocess_communication_rx();
      ~interprocess_communication_rx() override;


      bool create(const ::string & pszChannel);
      ::e_status destroy() override;


      void on_interprocess_receive(::string && strMessage) override;
      void on_interprocess_receive(int message, ::memory && memory) override;
      void on_interprocess_post(i64 a, i64 b) override;


      virtual bool on_idle();


      virtual bool start_receiving();

      virtual void * receive();


      bool is_rx_ok();


   };


//   class CLASS_DECL_APEX interprocess_communication :
//      virtual public interprocess_communication_base,
//      virtual public ::interprocess_communication::interprocess_communication
//   {
//   public:
//
//
//      interprocess_communication();
//      virtual ~interprocess_communication();
//
//
//#if defined(_UWP)
//      bool open_ab(const ::string & pszChannel, const ::string & pszModule);
//      bool open_ba(const ::string & pszChannel, const ::string & pszModule);
//#elif defined(WINDOWS)
//      bool open_ab(const ::string & pszChannel, const ::string & pszModule, launcher * plauncher = nullptr);
//      bool open_ba(const ::string & pszChannel, const ::string & pszModule, launcher * plauncher = nullptr);
//#else
//      bool open_ab(const ::string & pszChannel, launcher * plauncher = nullptr);
//      bool open_ba(const ::string & pszChannel, launcher * plauncher = nullptr);
//#endif
//
//
//      bool close();
//
//
//      virtual void restart_apex_ipc();
//
//      //bool ensure_tx(const ::string & pszMessage, duration durationTimeout = one_hour());
//      //bool ensure_tx(int message, void * pdata, int len, duration durationTimeout = one_hour());
//
//
//      bool is_rx_tx_ok();
//
//
//   };


   CLASS_DECL_APEX string app_install(string strPlatform = "");


} // namespace windows



