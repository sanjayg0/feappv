!$Id:$
      subroutine filargs(nargs)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    22/07/2017
!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Get command line arguments

!      Inputs:

!      Outputs:
!         nargs  - Number of command line arguments found
!         File names returned in common /comfil/
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'comfil.h'

      integer   (kind=4)  :: nargs
      character (len=128) :: inp, otp, res, sav
      character (len=130) :: argv
      integer   (kind=4)  :: i, nchars

      save

!     Set files to blank

      inp = ' '
      otp = ' '
      res = ' '
      sav = ' '

!     Check arguments set on command line

      nargs = command_argument_count()

      if(nargs.gt.0) then
        do i = 1, nargs

          call get_command_argument(i,argv)
          nchars = len_trim(argv)
  
          if (argv(1:1) .eq. '-') then

!           Input file specification

            if      (argv(2:2).eq.'i') then
              inp = argv(3:nchars)

!           Output file specification

            else if (argv(2:2).eq.'o') then
              otp = argv(3:nchars)

!           Restart read file specification

            else if (argv(2:2).eq.'r') then
              res = argv(3:nchars)

!           Restart save file specification

            else if (argv(2:2).eq.'s') then
              sav = argv(3:nchars)

!           Error on command line

            else
              write( *, 2000) argv(2:nchars)
              call plstop(.true.)
            endif

!         Error on first character

          else
            write( *, 2001)  argv(1:nchars)
            call plstop(.true.)
          endif
        end do ! i

!       Check that files are correct if nargs > 0

        if(inp.ne.' ') then

          if(otp.eq.' ') then
            otp      = inp
            otp(1:1) = 'O'
          endif
          if(res.eq.' ') then
            res      = inp
            res(1:1) = 'R'
          endif
          if(sav.eq.' ') then
            sav      = inp
            sav(1:1) = 'R'
          endif

!       One of the command arguments must be for input file

        else
          write( *, 2002)
          call plstop(.true.)
        endif

      endif ! nargs > 0

!     Formats

2000  format(' *ERROR* Unknown command line option   -> ',a/
     &       '         First character must be: -')
2001  format(' *ERROR* Unknown command line argument -> ',a/
     &       '         Must be: i, o, r, or s')
2002  format(' *ERROR* Command line arguments must include an'/
     &       '         INPUT filename with form: -iI....')

      end
