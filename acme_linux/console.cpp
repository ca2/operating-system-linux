#include "framework.h"
#include "acme/os/console.h"
#include "console.h"


void __console_init(void ** ppscreen, void ** ppwindow, FILE * pfileOut, FILE * pfileIn, int cols, int lines);
void __console_term(void * pscreen);
void __console_set_cursor_position(void * pscreen, int line, int column);
void __console_set_text_color(void * pscreen, int color);
void __console_write(void * pscreen, const char * psz);


namespace linux
{


   console::console()
   {

      m_pscreen = nullptr;
      m_pwindow = nullptr;

      m_iColor = -1;

   }


   console::~console()
   {

      __console_term(m_pscreen);

   }


   string_stream & console::cout()
   {

      return m_cout;

   }


   // maximum mumber of lines the output console should have

   static const ::u16 MAX_CONSOLE_LINES = 500;

   void console::redirect_io()
   {

//      int hConHandle;
//
//      long lStdHandle;
//
//      CONSOLE_SCREEN_BUFFER_INFO coninfo;
//
//      FILE *fp;
//
//      // allocate a console for this app
//
//      // set the screen buffer to be big enough to let us scroll text
//
//      GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE),
//
//       &coninfo);
//
//      coninfo.dwSize.Y = MAX_CONSOLE_LINES;
//
//      SetConsoleScreenBufferSize(GetStdHandle(STD_OUTPUT_HANDLE),
//
//       coninfo.dwSize);
//
//      // redirect unbuffered STDOUT to the console
//
//      lStdHandle = (long)GetStdHandle(STD_OUTPUT_HANDLE);
//
//      hConHandle = _open_osfhandle(lStdHandle,_O_TEXT);
//
//      fp = _fdopen(hConHandle,"w");
//
//      *stdout = *fp;
//
//      setvbuf(stdout,nullptr,_IONBF,0);
//
//      // redirect unbuffered STDIN to the console
//
//      lStdHandle = (long)GetStdHandle(STD_INPUT_HANDLE);
//
//      hConHandle = _open_osfhandle(lStdHandle,_O_TEXT);
//
//      fp = _fdopen(hConHandle,"r");
//
//      *stdin = *fp;
//
//      setvbuf(stdin,nullptr,_IONBF,0);
//
//      // redirect unbuffered STDERR to the console
//
//      lStdHandle = (long)GetStdHandle(STD_ERROR_HANDLE);
//
//      hConHandle = _open_osfhandle(lStdHandle,_O_TEXT);
//
//      fp = _fdopen(hConHandle,"w");
//
//      *stderr = *fp;
//
//      setvbuf(stderr,nullptr,_IONBF,0);

      //make cout, wcout, cin, wcin, wcerr, cerr, wclog and clog

      //point_i32 to console as well

      //ios::sync_with_stdio();

   }


   void console::SetWindowSize(int height,int width)
   {

      m_iH = height;
      m_iW = width;

      if(!m_pscreen)
      {

         m_pfileIn.create_new();
         m_pfileOut.create_new();

         auto pszFileIn = tmpnam(nullptr);
         auto pszFileOut = tmpnam(nullptr);

         auto estatusIn = m_pfileIn->open(pszFileIn, ::file::e_open_read | ::file::e_open_write | ::file::e_open_create | ::file::e_open_truncate);
         auto estatusOut = m_pfileOut->open(pszFileOut, ::file::e_open_write| ::file::e_open_write | ::file::e_open_create | ::file::e_open_truncate);

         m_cout.m_p = m_pfileOut;

         __console_init(&m_pscreen, &m_pwindow, m_pfileOut->m_pfile, m_pfileIn->m_pfile, m_iW, m_iH);

      }
      /*      SMALL_RECT window;
            window.Top = 0;
            window.Left = 0;
            window.Bottom = height - 1;
            window.Right = width - 1;
            SetConsoleWindowInfo(GetStdHandle(STD_OUTPUT_HANDLE),true,&window);
            COORD buffer ={width,height};
            SetConsoleScreenBufferSize(GetStdHandle(STD_OUTPUT_HANDLE),buffer);
      */
   }

   void console::SetCursorVisibility(bool show)
   {
      /*    CONSOLE_CURSOR_INFO cursor;
          GetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE),&cursor);
          cursor.bVisible = show;
          SetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE),&cursor);*/
   }


   void console::SetCursorPosition(int y,int x)
   {

      __console_set_cursor_position(m_pscreen, y, x);

   }


   void console::SetTextColor(int color)
   {

      if(m_iColor != -1)
      {

         __console_set_text_color(m_pscreen, color);

      }

      m_iColor = color;

      __console_set_text_color(m_pscreen, color);

   }


   void console::SetScreenColor(enum_dos_color color, int iLineStart, int iLineCount)
   {

//      COORD coord ={0,iLineStart};
//      ::u32 dwWritten;
//      if(iLineCount < 0)
//         iLineCount = m_iH + iLineCount + 1;
//      if(iLineCount > m_iH - iLineStart)
//         iLineCount = m_iH - iLineStart;
//      FillConsoleOutputAttribute(GetStdHandle(STD_OUTPUT_HANDLE),color,iLineCount * m_iW,coord,&dwWritten);

   }


   void console::write(const char * psz)
   {

      __console_write(m_pscreen, psz);

   }


} // namespace windows



