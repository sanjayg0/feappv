!$Id:$
      subroutine pmacr2(lct,ct,j)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Command language instruction subprogram: Part 2

!      Inputs:
!         lct(*)     - Command option
!         ct(3,*)    - Command parameters
!         j          - Command number in this routine

!      Outputs:
!         Depends on command number j
!-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      include  'arclel.h'
      include  'arcler.h'
      include  'augdat.h'
      include  'cdata.h'
      include  'comfil.h'
      include  'counts.h'
      include  'crotas.h'
      include  'ddata.h'
      include  'debugs.h'
      include  'evdata.h'
      include  'fdata.h'
      include  'hdatam.h'
      include  'iofile.h'
      include  'ldata.h'
      include  'mxsiz.h'
      include  'ndata.h'
      include  'pointer.h'
      include  'print.h'
      include  'prflag.h'
      include  'prld1.h'
      include  'prlod.h'
      include  'rdata.h'
      include  'rdat0.h'
      include  'sdata.h'
      include  'tdata.h'
      include  'tdato.h'
      include  'umac1.h'
      include  'comblk.h'

      logical   pcomp,err, errck, tinput,setvar,palloc
      integer   i,j,n, k1
      real*8    dtnew

      character lct(*)*15,lctl(2)*15
      integer   npl(2)
      real*8    ct(3,*),ctl(25)

      real*8    propld

      save

!     Transfer to correct process

      go to (1,2,3,4,5,6,7,8,8,10,11,12,13,14,15), j

!     Set solution tolerance
!     [tol,,value]       - set relative convergence tolerance to tol
!     [tol,ener,value]   - set absolute convergence tolerance to enzer
!     [tol,emax,value]   - set comparison value for convergence to emax

1     if(pcomp(lct(l),'ener',4)) then

!       Set energy assumed zero value

        enzer = abs(ct(1,l))
        write(iow,2008) enzer
        if(ior.lt.0 .and. prnt) write(*,2008) enzer

      elseif(pcomp(lct(l),'emax',4)) then

!       Set convergence limit

        if(ct(1,l).ne.0.0d0) then
          rnmax = ct(1,l)
          write(iow,2007) rnmax
          if(ior.lt.0 .and. prnt) write(*,2007) rnmax
        end if

      else

!       Set normal tolerance value

        tol = ct(1,l)
        write(iow,2013) tol
        if(ior.lt.0 .and. prnt) write(*,2013) tol

      endif

      return

!     Set time increment
!     [dt,,value]

2     dtold = dt
      dt    = ct(1,l)
      return

!     Set loop start indicators
!     [loop,,number]

3     lv = lv + 1
      lvs(lv) = l
      lve(lv) = nint(ct(2,l))
      ct(1,lve(lv)) = 1.d0
      ct(3,lve(lv)) = 1.d0
      floop(1)      = .true.
      floop(2)      = .false.
      return

!     Loop terminator control
!     [next]

4     n       = nint(ct(2,l))
      ct(1,l) = ct(1,l) + 1.0d0
      ct(3,l) = ct(3,l) + 1.0d0

!     Loop checks

      if(ct(1,l).le.ct(1,n)) then
        l  = n                         ! increment loop
      else

!       No tangent convergence warning

        if(lv.gt.1 .and. floop(1) .and. floop(2) .and.
     &    (nint(ct(3,l)).gt.nint(ct(1,n))) .and. niter.gt.1) then
          write(iow,2014) ttim
          if(ior.lt.0) write(*,2014) ttim
        end if

        floop(2) = .false.
        lv       = lv - 1              ! terminate loop

      end if
      return

!     Input proportional load table
!     [prop,,num1] - input 1 to num1 proportional loads
!     [prop,,num1,num2] - input proportional loads num1 to num2
!     [prop,off]   - disable proportional loading, set time to 0.

5     if(pcomp(lct(l),'off',3)) then
        npld = 0
        prop = 1.0d0
        ttim = ct(1,l)
        dt   = ct(2,l)
        write(iow,2001)
        if(ior.lt.0 .and. prnt) write(*,2001)
      else
        uct    = lct(l)(1:4)
        npl(1) = nint(min(ct(1,l),ct(2,l)))
        npl(2) = nint(max(ct(1,l),ct(2,l)))
        if(npl(1).eq.0) then
          npl(2) = max(1,npl(2))
          npl(1) = npl(2)
        elseif(npl(1).lt.0) then
          npld = 0
          prop = 1.0d0
          write(iow,2001)
          if(ior.lt.0 .and. prnt) write(*,2001)
          return
        endif
        npld = max(npld,min(npl(2),50))
        prop = propld (ttim,npl)
        uct  = '    '
      endif

      return

!     Data command
!     [data,tol] : Set 'tol' as data (change during execution)
!     [data,dt]  : Set 'dt'  as data (change during execution)

6     if(ior.lt.0 .and. prnt) write(*,3000) lct(l)
      errck = tinput(lctl,2,ctl,3)
      if(errck) go to 6

!     Error diagnostics

      if(.not.pcomp(lct(l),lctl(1),4)) then
        write(iow,4001)
        if(ior.lt.0) then
          write(*,4001)
          go to 6
        end if
        call plstop(.true.)
      end if

!     Set appropriate number

      if(pcomp(lctl(1),'tol ',4)) tol = ctl(1)
      if(pcomp(lctl(1),'dt  ',4)) dt  = ctl(1)
      return

!     [time],,<tmax> : Increment time , quit after time > tmax

7     if(pcomp(lct(l),'set ',4)) then
        ttim = ct(1,l)
        return
      end if

      call ptimpl()

!     Increment time

      ttim     = ttim + dt
      floop(1) = .false.

!     Update Database to n+1 (hflgu is true)

      hflgu  = .true.
      h3flgu = .true.
      call formfe(np(40),np(26),np(26),np(26),
     &           .false.,.false.,.false.,.false.,12,1,numel,1)

      if(ct(1,l).gt.0.0d0 .and. ttim.ge.ct(1,l)) then
        ct(1,lve(lv)) = ct(1,lvs(lv))
      end if
      npl(1) = 0
      propo = prop
      if(npld.gt.0) prop = propld(ttim,npl)
      if(arcf) then
        if(abs(prop-propo).gt.1.d-8) then
          write(iow,4002)
          if(ior.lt.0) then
            write(*,4002)
          endif
          call plstop(.true.)
        endif
      endif
      if(prnt) then
        if(npld.gt.1) then
          k1 = npld
        else
          k1 = 0
        endif
        write(iow,2002) ttim,prop,(i,prldv(i),i=1,k1)
        if(ior.lt.0) then
          write(*,2002) ttim,prop,(i,prldv(i),i=1,k1)
        endif
      endif
      augf  = 1.0d0
      rnmax = 0.0d0

!     Zero displacement increment for time step

      call pzero(hr(np(40)+nneq),nneq)

!     Update dynamic vectors for step

      if(fl(9)) then
        call dsetci
        call update(mr(np(31)),hr(np(30)),hr(np(40)),hr(np(42)),
     &              hr(np(26)),fl(9),1)
      end if

      fl( 8) = .false.
      fl(10) = .true.

!     Move interpolated force vector

      call pmove (hr(np(30)       ),hr(np(30)+  nneq), nneq)
      call pmove (hr(np(30)+2*nneq),hr(np(30)+3*nneq), nneq)

!     Reset history variables

      call reshis(mr(np(33)+nen),nen1,numel,2, 1)

!     Set iteration counter to indicate begining of time step

      titer  = titer + niter
      niter  = 0
      taugm  = taugm + naugm
      naugm  = 0
      nstep  = nstep + 1
      iaugm  = 0
      dtold  = dt

      return

!     Set print flag for print outputs
!     [prin/nopr,data]      - Permits data from inputs to be on or off
!     [prin/nopr,comm]and   - Controls print/noprint commands to screen
!     [prin/nopr,on/off]    - Old form for 'comm'and option
!     [prin/nopr,less]      - Prints shorter prompts to screen
!     [prin/nopr]           - Old form for 'less' option
!     [prin,mass/cmas/geom] - Print consistent mass array diagonals
!     [prin,iden/lmas]      - Print identity or lump mass array diagonals
!     [prin,tang/utan]      - Print tangent stiffness array diagonals
!     [prin,resi]           - Print residual array (diagonal)

8     if    (pcomp(lct(l),'data',4)) then
        prt  = j.eq.8
      elseif(pcomp(lct(l),'comm',4)) then
        prnt = j.eq.8
      elseif(pcomp(lct(l),'less',4)) then
        pfr  = j.eq.8
      elseif(pcomp(lct(l),'off', 3)) then
        prnt = .false.
      elseif(pcomp(lct(l),'on',  2)) then
        prnt = .true.
      elseif(pcomp(lct(l),'lmas',4).or.pcomp(lct(l),'iden',4)) then
        call mprint(hr(nl),1,neq,1,'Lmas/Iden ' )
      elseif(pcomp(lct(l),'cmas',4).or.pcomp(lct(l),'mass',4)
     &                             .or.pcomp(lct(l),'geom',4)) then
        call mprint(hr(nm),1,neq,1,'Cmas/Geom ' )
      elseif(pcomp(lct(l),'tang',4).or.pcomp(lct(l),'utan',4)) then
        call mprint(hr(na),1,neq,1,'Tang-diag ' )
      elseif(pcomp(lct(l),'resi',4)) then
        call mprint(hr(np(26)),1,neq,1,'Residuals ' )
      elseif(pcomp(lct(l),'    ',4)) then
        pfr  = j.eq.8
      end if
      return

!     Input integration parameters and initialize vectors
!     [beta,xxxx,beta,gamma,alpha]: see dparam for 'xxxx' options
!     [tran,xxxx,beta,gamma,alpha]: see dparam for 'xxxx' options

10    fl(9) = .true.
      call dparam(ct(1,l),lct(l))
      setvar = palloc( 42,'VEL  ',nneq*nrt ,2)
      return

!     Input initial conditions for dynamic integration
!     [init,disp] - set initial displacements
!     [init,rate] - set initial rates

11    call pinitl(lct(l),err)
      return

!     Define an identity vector for stiffness eigen computation
!     [iden,,n1,n2]  - set dof n1 to n2 to unity

12    setvar = palloc(13,'LMAS1',neq,2)
      nl    = np(13)
      imtyp = 1
      idenf = .true.
      fl(1) = .false.
      fl(2) = .true.
      fl(5) = .false.
      nx    = 13
      nxl   = neq
      call pzero(hr(nl),neq)
      n = nint(ct(1,l))
      n = max(1,(n-1)*ndf+1)
      i = nint(ct(2,l))*ndf
      if(i.eq.0) i = neq
      call piden(hr(nl),n,i)
      return

!     Update current force vector f0
!     [newf]
!     [newf,zero]

13    if(pcomp(lct(l),'zero',4)) then
        do n = 0,nneq-1
          hr(np(28)+i+2*nneq) = 0.0d0  ! f0(n,1) = fixed forces
          hr(np(28)+i+3*nneq) = 0.0d0  ! f0(n,2) = fixed displacements
        end do
        write(iow,2009)
        if(ior.lt.0 .and. prnt) write(*,2009)
      else
        call pload0(hr(np(27)),hr(np(28)+2*nneq),hr(np(40)),
     &              nneq,prop*rlnew )
      end if
      rlnew = 0.0d0
      return

!     Backup a time step
!     [back,,dt] - back-up to beginning of time step reset dt.

14    dtnew = max(0.0d0,ct(1,l))
      call autbac(dtnew)
      return

!     Debug flag on/off
!     [debug,on,level] or [debug,off] or [debug,,level]

15    if(pcomp(lct(l),'    ',4)) debug = .true.
      if(pcomp(lct(l),  'on',2)) debug = .true.
      if(pcomp(lct(l), 'off',3)) debug = .false.
      ndebug = nint(ct(1,l))
      if(debug) then
        if(ior.lt.0) write(  *,2003) ndebug
        if(ior.gt.0) write(iow,2003) ndebug
      else
        if(ior.lt.0) write(  *,2004)
        if(ior.gt.0) write(iow,2004)
      end if
      return

!     formats

2001  format(' Number of proportional loads set to zero & prop = 1.0')

2002  format(/,'   Computing solution at time ',1p,e11.4,
     &         ': Total proportional load ',1p,e11.4:/
     &         '   Individual factors: '/(3x,4(i4,' =',1p,e12.4)))

2003  format(/'   Debug flag is set to .true. - Printing is on'/
     &        '   Debug level =',i4)

2004  format(/'   Debug flag is set to .false. - Printing is off'/)

2007  format(/'   Non-linear Problem - RNMAX =',1p,e12.5/)

2008  format(/'   Energy assumed zero when less than ',1p,e12.5/)

2009  format(/'   F0 vector set to zero'/)

2013  format(/'   Solution tolerance = ',1p,e12.5/)

2014  format(/'   *WARNING* Check for NO CONVERGENCE at time =',
     &            1p,1e15.5/)

3000  format(' Input ',a4,' Macro >',$)

4001  format(/' *ERROR* Command label mismatch on data command')

4002  format(/' *ERROR* Variable proportional loading not allowed with',
     &        ' ARCLength.')

      end
