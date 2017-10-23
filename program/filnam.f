!$Id:$
      subroutine filnam

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Set up files for input/output, etc.

!      Inputs:
!         None

!      Outputs:
!         File names returned in common /comfil/
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'codat.h'
      include  'chdata.h'
      include  'comfil.h'
      include  'iodata.h'
      include  'iofile.h'
      include  'machnc.h'
      include  'psize.h'
      include  'vdata.h'

      logical   pcomp,lfil,linp,lout,lres,lsav,cinput
      character wd(2)*6,y*1
      character dinp*128,dout*128,dres*128
      character pinp*128,pout*128,pres*128,psav*128,pplt*128,filein*128
      integer   iorsav, ierr
      integer   nargs, iinp, ioup, ires, isav, j

      save

      data      dinp,dout,dres/'NONE','NONE','NONE'/

      data      wd/'New','Exists'/

!     Save input unit number set command line arguments to 0

      iorsav = ior
!     Add extenders or get filenames from command line

      findex = 1
      nargs  = 0
      epmac  = epsilon(1.0d0)
      call filargs(nargs)

!     Look to see if any problem has been run

101   inquire(file='feapname',exist=lfil)
      if(lfil) then
        open(ios,file='feapname',status='unknown')
        read(ios,2010,err=900,end=900) pinp,pout,pres,psav,pplt
        close(ios)
        finp = pinp
        fout = pout
        fres = pres
        fsav = psav
        fplt = pplt

!       Compute solution timings

        if(nargs.eq.0) then
          ior = -abs(ior)
          write(*,2000) versn
        endif
        go to 200
      else

!       Set default file names

        ior = -abs(ior)
        write(*,2000) versn
        pinp = dinp
        pout = dout
        pres = dres
        psav = dres
        pplt = dinp
      endif

!     Name file for input data

100   ierr = 1
      finp = pinp

!      Use current filenames

1     if(y.eq.'N' .or. y.eq.'n' .or. y.eq. ' ') then
        write(*,2011)
        write(*,2002) pinp
      else
        write(*,2001)
        write(*,2002) pinp
      endif

!     User input of filenames

      write(*,2006)
!      read (*,1000,err=901,end=902) filein
      if(.not.cinput()) then
        goto 902
      end if
      filein = record(1:128)

!     Check for stop

      if (pcomp(filein,'stop',4) .or.
     &    pcomp(filein,'exit',4) .or.
     &    pcomp(filein,'quit',4)) then
        call plstop(.false.)

!     Set active input flename

      elseif (.not.pcomp(filein,' ',1)) then
        finp = ' '
        finp = filein
        do j = len_trim(finp),1,-1
          if(finp(j:j).eq.char(47) .or.       ! char(47) = '/'
     &       finp(j:j).eq.char(92)) go to 110 ! char(92) = '\'
        end do ! j
        j = 0
110     findex = j + 1
      endif

!     Check if input files exists

10    inquire(file=finp,exist=linp)
      if(.not.linp) then
        write(*,3000) finp
        go to 1
      endif
      pinp = finp

!     Set default files for a filname beginning with 'I' or 'i'

      if(pcomp(pinp,'I',1)) then
        pinp(findex:findex) = 'I'
        pout                = pinp
        pout(findex:findex) = 'O'
        pres                = pinp
        pres(findex:findex) = 'R'
        psav                = pinp
        psav(findex:findex) = 'R'
      endif
!     Set default filenames from previous executions

      fout = pout
      fres = pres
      fsav = psav
      fplt = pplt

!     Accept current files unless reset requested

      if(y.ne.'R' .and. y.ne.'r') then
        go to 200
      endif

!     Name file for output data

      ierr =  2
      fout = pout
2     write(*,2003) pout
!     read (*,1000,err=901,end=902) filein
      if(.not.cinput()) then
        goto 902
      end if
      filein = record(1:128) 
      if (.not.pcomp(filein,' ',1)) fout = filein
20    pout = fout

!     Name file for restart read data

      ierr =  3
      fres = pres
3     write(*,2004) pres
!     read (*,1000,err=901,end=902) filein
      if(.not.cinput()) then
        goto 902
      end if
      filein = record(1:128)
      if (.not.pcomp(filein,' ',1)) fres = filein
30    pres = fres

!     Name file for restart save data

      ierr = 4
      fsav = psav
4     write(*,2005) psav
!     read (*,1000,err=901,end=902) filein
      if(.not.cinput()) then
        goto 902
      end if
      filein = record(1:128)
      if (.not.pcomp(filein,' ',1)) fsav = filein
40    psav = fsav

!     Set default plot window

      pplt      = pinp
      pplt(1:1) = 'P'
      fplt      = pplt

!     Check file status and input if necessary

200   inquire(file=finp,exist=linp)
      if(.not.linp .and. nargs.gt.0) call plstop(.true.)
      if(.not.linp) go to 100
      iinp = 2
      inquire(file=fout,exist=lout)
      ioup = 1
      if(lout) ioup = 2
      inquire(file=fres,exist=lres)
      ires = 1
      if(lres) ires = 2
      inquire(file=fsav,exist=lsav)
      isav = 1
      if(lsav) isav = 2
      if(nargs.gt.0) go to 300
      write(*,2007) wd(iinp),finp,wd(ioup),fout,wd(ires),fres,
     &              wd(isav),fsav

!     Start execution

      if(.not.fileck) go to 300
      write(*,2008)
      ierr =  5
!5    read(*,1000,err=901,end=901) y
5     if(.not.cinput()) then
        goto 901
      end if
      y = record(1:1) 
      if(y.eq.'S' .or. y.eq.'s') call plstop(.false.)
      if(y.ne.'Y' .and. y.ne.'y') go to 100

!     Save a copy of current filenames

300   open(ios,file='feapname',status='unknown')
      rewind ios
      write(ios,2010) finp,fout,fres,fsav,fplt
      close(ios)
      write(*,2009)

!     Reset ior unit number

      ior = iorsav
      return

!     Error in form of feapname file

900   lfil = .false.
      write(*,'(/a)') ' ERROR IN feapname FILE -- Read filenames'
      close(ios,status = 'delete')
      go to 101

!     Error trap

901   write(*,3001)
      if(    ierr.eq.1) then
        go to 1
      elseif(ierr.eq.2) then
        go to 2
      elseif(ierr.eq.3) then
        go to 3
      elseif(ierr.eq.4) then
        go to 4
      elseif(ierr.eq.5) then
        go to 5
      else
        call plstop(.true.)
      endif

!     EOF encountered

902   call  endclr ('FILNAM',filein)
      if(    ierr.eq.1) then
        go to 10
      elseif(ierr.eq.2) then
        go to 20
      elseif(ierr.eq.3) then
        go to 30
      elseif(ierr.eq.4) then
        go to 40
      elseif(ierr.eq.5) then
        go to 5
      else
        call plstop(.true.)
      endif

!     Formats

!1000  format(a)

2000  format(//
     & '    F I N I T E   E L E M E N T   A N A L Y S I S',
     & '   P R O G R A M'
     &   /14x,'FEAPpv (P e r s o n a l   V e r s i o n)',
     &  //13x,'(C) Regents of the University of California'
     &   /23x,'All Rights Reserved.'/23x,'VERSION: ',a/26x,'DATE: ',a)

2001  format(/8x,' I n p u t    F i l e n a m e s',
     & //8x,' Specify filenames:'/)
2002  format(13x,'Input   Data (default: ',a32,') :',$)
2003  format(13x,'Output  Data (default: ',a32,') :',$)
2004  format(13x,'Restart Read (default: ',a32,') :',$)
2005  format(13x,'Restart Save (default: ',a32,') :',$)
2006  format(/22x,'Enter Name --> ',$)

2007  format(/8x,' Files are set as:     Status  Filename'//
     &       13x,'Input   (read ) : ',a6,2x,a32/
     &       13x,'Output  (write) : ',a6,2x,a32/
     &       13x,'Restart (read ) : ',a6,2x,a32/
     &       13x,'Restart (write) : ',a6,2x,a32//
     &  8x,' Caution, existing write files will be overwritten.')

2008  format(/8x,' Are filenames correct?',
     &     '( y or n; r = redefine all; s = stop) :',$)

2009  format(/8x,' R U N N I N G    F E A P p v    P R O B L E M',
     &           '    N O W')

2010  format(a/a/a/a/a/1p,1e25.15)

2011  format(/8x,'Specify input data filename:'/)

3000  format(/' *ERROR* FILNAM: Specified input file: ',a/
     &        '         does not exist. Reinput filename.'/)
3001  format(/' *ERROR* FILNAM: Reinput data')

      end
