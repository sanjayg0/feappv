!$Id:$
      subroutine pmesh(iii,prt,prth)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Data input routine for mesh description

!      Inputs:
!         iii        - Initialization indicator
!         prt        - Flag, print input data if true
!         prth       - Flag, print title/header if true

!      Outputs:
!         Depends on commands specified
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'bdata.h'
      include  'cblend.h'
      include  'cblktr.h'
      include  'cdata.h'
      include  'cdat1.h'
      include  'cdat2.h'
      include  'chdata.h'
      include  'codat.h'
      include  'comfil.h'
      include  'corset.h'
      include  'cornum.h'
      include  'debugs.h'
      include  'dstars.h'
      include  'edgdat.h'
      include  'eldata.h'
      include  'eqslv.h'
      include  'hlpdat.h'
      include  'iodata.h'
      include  'iofile.h'
      include  'iosave.h'
      include  'meshtx.h'
      include  'pdata3.h'
      include  'pglob1.h'
      include  'pointer.h'
      include  'prflag.h'
      include  'prld1.h'
      include  'region.h'
      include  'sdata.h'
      include  'setups.h'
      include  'trdata.h'
      include  'umac1.h'
      include  'comblk.h'

      character (len=8) :: c2,fext
      character (len=4) :: wd(60),cc,usub

      logical       :: setvar,palloc, lp_in
      logical       :: prt,error,pcomp,lmesh,errck,pinput,tinput
      logical       :: prth, umesh, readfl, savefl, flgco,vinput

      integer       :: i,j, ii,jj, iii, isd, ibn, n, side, face
      integer       :: ll,llo,list, numesh, nblend, nmat,nord,nnty

      integer       :: ed(60)
      real (kind=8) :: td(16)

      save

!     Length of command data lists

      data  list    /60/, numesh /12/

!     List of command names

      data wd/'coor','elem','mate','boun','forc','disp','temp','angl',
     1        'eang','ebou','edis','efor','epro','fpro','mpro','ereg',
     2        'cang','cbou','cdis','cfor','cpro','csur','regi','rese',
     3        'bloc','btem','pola','shif','blen','snod','side','tran',
     4        'para','prin','nopr','pars','nopa','debu','glob','titl',
     5        'loop','next','*nod','*ele','peri','manu','lbou','end',
     u        'mes1','mes2','mes3','mes4','mes5','mes6','mes7','mes8',
     u        'mes9','me10','me11','me12'/

      data ed/    0,     0,     0,     0,     0,     0,     0,     0,
     1            0,     0,     0,     0,     1,     2,     2,     1,
     2            0,     0,     0,     0,     2,     0,     0,     1,
     3            0,     1,     0,     0,     0,     0,     0,     1,
     4            0,     0,     0,     2,     2,     2,     0,     2,
     5            0,     0,     0,     0,     1,     4,     4,     0,
     u            5,     5,     5,     5,     5,     5,     5,     5,
     u            5,     5,     5,     5 /


!     Initialize arrays and set error detection values

      lp_in = .true.
      error = .false.
      lmesh = .false.
      ll    = 1
      nneq  = ndf*numnp
      if(iii.ge.0) then
        if    (ndm.eq.2) then
          g2type    = 2
        elseif(ndm.eq.3) then
          g2type    = 7
        else
          g2type    = 8
        endif
        gdtype      = 1
        gtdof       = 0
        nreg        = 0
        mxreg       = 0
        nblend      = 0
        npstr       = 0
        numg        = 0
        nio         = 0
        neo         = 0
        mao         = 0
        ibn         = 21  ! Add one to store netype
        isd         = 16
        side        = 0
        face        = 0

!       Set angles, boundary code/forced values to zero

        do j = 1,3
          do i = 1,3
            tr(i,j) = 0.d0
          end do ! i
          tr(j,j) = 1.d0
          xr(j)   = 0.d0
          x0(j)   = 0.d0
        end do
        trdet = 1.d0
        if(iii.eq.0) then
          prt = .true.

!         Set node type to undefined

          do j = 0,numnp-1
            mr(np(190)+j) = -1
          end do

          do j = 1,50
            prldv(j) = 1.d0
          end do

!         Set user macro mesh input names

          do j = 1,numesh
            write(usub,'(a3,i1)') 'mes',j
            i   = list - numesh + j
            if(.not.pcomp(umshc(j),wd(i),4)) then
              wd(i) = umshc(j)
              ed(i) = 0
            endif
          end do

        endif
      endif
100   if(ior.lt.0) write(*,2000) ll
      errck = tinput(tx,8,td,0)
      if(errck) go to 100
      utx(1) = tx(1)
      utx(2) = tx(2)
      cc     = tx(1)(1:4)
      c2     = tx(2)(1:4)
      if( pcomp(cc,'read',4) ) then
        if(chflg .and. pcomp(c2,'end',3)) return
        lmesh = readfl(tx(2))
        if(lmesh) then
          llo = ll
        else
          ll  = llo
        endif
        go to 100
      endif
      if(pcomp(cc,'save',4)) then
        lsave = savefl(tx(2))
        go to 100
      endif
      if(ior.lt.0.and.pcomp(cc,'help',4)) then
        call phelp(c2,wd,ed,list,'MESH')
        go to 100
      endif
      go to 120
110   call  errclr ('PMESH ')
      go to 100
120   do i = 1,list
        if(pcomp(cc,wd(i),4)) go to 130
      end do

!     User mesh commands

      if(.not. pcomp( cc, ' ', 1 ) ) errck = umesh(cc,tx,prt)
      if(.not. errck .and. ior.lt.0) call errclr('PMESH ')
      go to 100
130   ll = ll + 1

      go to ( 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19,

!             c  e  m  b  f  d  t  a  e  e  e  e  e  f  m  e  c  c  c  i
!             o  l  a  o  o  i  e  n  a  b  d  f  p  p  p  r  a  b  d  c
!             o  e  t  u  r  s  m  g  n  o  i  o  r  r  r  e  n  o  i
!             r  m  e  n  c  p  p  l  g  u  s  r  o  o  o  g  g  u  s

     &       20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,34,36,36,38,

!             c  c  c  r  r  b  b  p  s  b  s  s  t  p  p  n  p  n  d
!             f  p  s  e  e  l  t  o  h  l  n  i  r  a  r  o  a  o  e
!             o  r  u  g  s  o  e  l  i  e  o  d  a  r  i  p  r  p  b
!             r  o  r  i  e  c  m  a  f  n  d  e  n  a  n  r  s  a  u

     &       39,40,41,42,43,44,45,46,47,48,

!             g  t  l  n  *  *  p  m  l  e
!             l  i  o  e  n  e  e  a  b  n
!             o  t  0  x  o  l  r  n  o  d
!             b  l  p  t  d  e  i  u  u

!     User Commands: Changed by subroutines umesh'n'

     &       91,91,91,91,91,91,91,91,91,91,91,91),i

!             m  m  m  m  m  m  m  m  m  m  m  m
!             e  e  e  e  e  e  e  e  e  e  e  e
!             s  s  s  s  s  s  s  s  s  1  1  1
!             1  2  3  4  5  6  7  8  9  0  1  2

!     [coor]dinates - nodal coordinate data input

1     call genvec(ndm,ndm,hr(np(43)),' Coordinates',
     &            prt,prth,error,.true.)
      go to 100

!     [elem]ent data input
!     [elem,gene,xxxxxx] set generation array

2     nmat = 0
      nord = 0
      nnty = 0
      do j = 2,8,2
        if(pcomp(tx(j),'type',4)) then
          call peltyp(tx(j+1),nnty)
        elseif(pcomp(tx(j),'orde',4)) then
          errck = vinput(tx(j+1),15,td,1)
          nord  = nint(td(1))
        elseif(pcomp(tx(j),'mate',4)) then
          errck = vinput(tx(j+1),15,td,1)
          nmat  = nint(td(1))
        endif
      end do ! j
      call pelmin(tx(2),mr(np(34)),mr(np(33)),nen1,
     &            nmat,nnty,nord,prt,prth,error)
      go to 100

!     [mate]rial,ma: Data input for material set ma

3     setvar = palloc(151,'USER1', ndf*(nen+1),1)
      call pmatin(tx,hr(np(25)),hr(np(41)),hr(np(44)),hr(np(39)),
     &               hr(np(36)),hr(np(35)),mr(np(34)),mr(np(32)),
     &               mr(np(240)),mr(np(151)),prt,prth)
      setvar = palloc(151,'USER1', 0, 1)
      go to 100

!     [boun]dary codes - read in restraint conditions for each node

4     call pbouin(mr(np(34)),mr(np(31)+nneq),prt,prth)
      go to 100

!     [forc]e/displ data input

5     call genvec(ndf,ndf,hr(np(27)),' Forces',prt,prth,error,.false.)
      go to 100

!     [disp]l data input

6     call genvec(ndf,ndf,hr(np(27)+ndf*numnp),' Displacements',
     &            prt,prth,error,.false.)
      go to 100

!     [temp]erature data input

7     call genvec(1,1,hr(np(38)),' Temperatures',prt,prth,error,.false.)
      go to 100

!     [angl]e - set boundary angles

8     call genvec(1,1,hr(np(45)),' Angles',prt,prth,error,.false.)
      go to 100

!     [eang] set edge angle constraints

9     eanfl = .true.
      fext  = 'ww0'
      if(neang.le.9) then
        write(fext(3:3),'(i1)') neang
      elseif(neang.le.99) then
        write(fext(2:3),'(i2)') neang
      endif
      neang = neang + 1
      if(.not.pcomp(c2,'set',3)) then
        c2 = 'add'                 ! default mode 'add' for edge angle
      endif
      call plinka(fext,c2)
      go to 100

!     [ebou] - set edge boundary constraints

10    ebcfl = .true.
      fext  = 'co0'
      if(nebcs.le.9) then
        write(fext(3:3),'(i1)') nebcs
      elseif(nebcs.le.99) then
        write(fext(2:3),'(i2)') nebcs
      endif
      nebcs = nebcs + 1
      if(.not.pcomp(c2,'set',3)) then
        c2 = 'add'                 ! default mode 'add' for edge b.c.
      endif
      call plinka(fext,c2)
      go to 100

!     [edis] set edge displacement constraints

11    edifl = .true.
      fext  = 'ud0'
      if(nedis.le.9) then
        write(fext(3:3),'(i1)') nedis
      elseif(nedis.le.99) then
        write(fext(2:3),'(i2)') nedis
      endif
      nedis = nedis + 1
      if(.not.pcomp(c2,'set',3)) then
        c2 = 'add'                 ! default mode 'add' for edge displ
      endif
      call plinka(fext,c2)
      go to 100

!     [efor] set edge force constraints

12    efcfl = .true.
      fext  = 'ld0'
      if(nefrc.le.9) then
        write(fext(3:3),'(i1)') nefrc
      elseif(nefrc.le.99) then
        write(fext(2:3),'(i2)') nefrc
      endif
      nefrc = nefrc + 1
      if(.not.pcomp(c2,'set',3)) then
        c2 = 'add'                 ! default mode 'add' for edge force
      endif
      call plinka(fext,c2)
      go to 100

!     [epro] set edge proportional load numbers

13    eprfl = .true.
      fext  = 'ep0'
      if(nepro.le.9) then
        write(fext(3:3),'(i1)') nepro
      elseif(nepro.le.99) then
        write(fext(2:3),'(i2)') nepro
      endif
      nepro = nepro + 1
      if(.not.pcomp(c2,'set',3)) then
        c2 = 'add'                 ! default mode 'add' for edge prop
      endif
      call plinka(fext,c2)
      go to 100

!     [fpro]  proportional load number specification

14    call genint(ndf,mr(np(29)),ndf,numnp,'P r o p.  L o a d  N o s.',
     &            '-dof',prt,prth,error,1)
      go to 100

!     [mpro]  mass proportional load number specification

15    call genint(ndf,mr(np(29)+nneq),ndf,numnp,
     &           'M a s s  P r o p.  L o a d','-dof',prt,prth,error,1)
      go to 100

!     [ereg] - set element regions

16    call genint(1,mr(np(33)+nen1-2),nen1,numel,'R e g i o n  N o s',
     &            '-regn',prt,prth,error,2)
      do j = nen1-2,numel*nen1,nen1
        mxreg = max(mxreg,mr(np(33)+j))
      end do
      go to 100

!     [cang] set coordinate angle - based on coordinates

17    angfl = .true.
      fext  = 'an0'
      if(nangf.le.9) then
        write(fext(3:3),'(i1)') nangf
      elseif(nangf.le.99) then
        write(fext(2:3),'(i2)') nangf
      endif
      nangf = nangf + 1
      call plinka(fext,c2)
      go to 100

!     [cbou] set coordinate boundary constraints - based on coordinates

18    boufl = .true.
      fext  = 'bn0'
      if(nbouf.le.9) then
        write(fext(3:3),'(i1)') nbouf
      elseif(nbouf.le.99) then
        write(fext(2:3),'(i2)') nbouf
      endif
      nbouf = nbouf + 1
      call plinka(fext,c2)
      go to 100

!     [cdis] set coordinate nodal forces - based on coordinates

19    disfl = .true.
      fext  = 'ds0'
      if(ndisf.le.9) then
        write(fext(3:3),'(i1)') ndisf
      elseif(ndisf.le.99) then
        write(fext(2:3),'(i2)') ndisf
      endif
      ndisf = ndisf + 1
      call plinka(fext,c2)
      go to 100

!     [cfor] set coordinate nodal forces - based on coordinates

20    forfl = .true.
      fext  = 'fr0'
      if(nforf.le.9) then
        write(fext(3:3),'(i1)') nforf
      elseif(nforf.le.99) then
        write(fext(2:3),'(i2)') nforf
      endif
      nforf = nforf + 1
      call plinka(fext,c2)
      go to 100

!     [cpro]  coordinate proportional load number specification

21    cprfl = .true.
      fext  = 'yp0'
      if(nprof.le.9) then
        write(fext(3:3),'(i1)') nprof
      elseif(nprof.le.99) then
        write(fext(2:3),'(i2)') nprof
      endif
      nprof = nprof + 1
      call plinka(fext,c2)
      go to 100

!     [csur] - surface loading by coordinates

22    surfl = .true.
      fext  = 'sl0'
      if(nsurf.le.9) then
        write(fext(3:3),'(i1)') nsurf
      elseif(nsurf.le.99) then
        write(fext(2:3),'(i2)') nsurf
      endif
      nsurf = nsurf + 1
      call plinka(fext,c2)
      go to 100


!     [regi,nreg]  set region number: all

23    read(yyy,1001,err=110,end=900) cc,nreg
      mxreg = max(mxreg,nreg)
      write(iow,2001) nreg,mxreg
      if(ior.lt.0) then
        write(*,2001) nreg,mxreg
      endif
      go to 100

!     [rese]t boundary condition codes to zero - permits releases

24    call pzeroi(mr(np(31)+nneq),ndf*numnp)
      go to 100

!     [bloc]k - generate block of nodes and elements

25    if(iii.lt.0) write(iow,3004)
      call blkgen(ndm,nen1,hr(np(43)),mr(np(33)),prt,prth)
      go to 100

!     [btem] - input block of interpolated temperatures

26    call blktem(ndm,hr(np(38)),prt,prth)
      go to 100

!     [pola]r - convert polar to cartesian coordinates

27    call polar(mr(np(190)),hr(np(43)),ndm,prt,prth)
      go to 100

!     [shif]t:<x0,y0,z0> - origin for polar/spherical conversions

28    errck = pinput(x0,3)
      if(errck) go to 28
      write(iow,2002) (x0(i),i=1,ndm)
      if(ior.lt.0) write(iow,2002) (x0(i),i=1,ndm)
      go to 100

!     [blen]ding interpolations (Delayed mesh generation feature)

29    if(iii.ge.0) then
        nblend = nblend + 1
        if(nblend.gt.numbd) then
          if(ior.gt.0) then
            write(iow,3000) nblend
            call plstop(.true.)
          else
            write(*,3000) nblend
          endif
          go to 30
        endif

        setvar = palloc (163, 'BTRAN', numbd*12          , 2)
        setvar = palloc (164, 'BLEND', numbd*ibn         , 1)
        setvar = palloc (166, 'BNILR', numbd*max(1,mxilr), 1)
        call pblend(hr(np(163)),mr(np(164)),mr(np(166)),nblend,ibn,ndm,
     &              prt,prth)
      else
        write(*,3003)
      endif
      go to 100

!     [snod]e - for blending interpolations

30    if(iii.ge.0) then
        setvar = palloc (161, 'BNODE', numsn*3, 2)
        call pnodes(hr(np(161)),ndm,prt,prth)
      else
        write(*,3002)
      endif
      go to 100

!     [side] - for blending interpolations

31    if(iii.ge.0) then
        setvar = palloc (162, 'BSIDE', numsd*isd, 1)
        call psides(mr(np(162)),side,isd,prt,prth,1)
      else
        write(*,3001)
      endif
      go to 100

!     [tran] - specify coordinate transformation array

32    errck = pinput(xr,3)
      if(errck) go to 32
      do j = 1,3
        tr(1,j) = xr(j)
      end do
      errck = pinput(xr,3)
      do j = 1,3
        tr(2,j) = xr(j)
      end do
      errck = pinput(xr,3)
      do j = 1,3
        tr(3,j) = xr(j)
      end do
      errck = pinput(xr,3)
      call mprint(tr,3,3,3,'Coord. T_matrix')
      call mprint(xr,1,3,1,'Coord. X_vector')
      trdet = tr(1,1)*(tr(2,2)*tr(3,3) - tr(2,3)*tr(3,2))
     &      + tr(1,2)*(tr(2,3)*tr(3,1) - tr(2,1)*tr(3,3))
     &      + tr(1,3)*(tr(2,1)*tr(3,2) - tr(2,2)*tr(3,1))
      go to 100

!     [para]meter - set parameter variables

33    coflg = .true.
      call pconst(prt)
      go to 100

!     [prin]t/[nopr]int of input data

34    prt = i.eq.34
      go to 100

!     [pars]ing/[nopa]rsing of statements

36    coflg = i.eq.36
      go to 100

!     [debu]g,<on,off>  Activate,deactivate debug option

38    if(pcomp(c2,'off',3)) then
        debug = .false.
      else
        debug = .true.
      endif
      go to 100

!     [glob]al - set global parameters

39    call global()
      go to 100

!     [titl] - set title prints on/off

40    if(pcomp(c2,'off',3)) then
        prth = .false.
      else
        prth = .true.
      endif
      go to 100

!     [loop,#] - Loop start

41    call ploops(lp_in,tx(2), 1)
      go to 100

!     [next] - Loop end

42    call ploops(lp_in,tx(2), 2)
      go to 100

!     [*nod] - Number to add to all input and generated nodes

43    j = index(record,'=')
      if(j.eq.0) then
        j = index(record,',')
      endif
      xxx(1:75) = ' '
      ii = 0
      do jj = j+1,75
        if(record(jj:jj).ne.' ') then
          ii = ii + 1
          xxx(ii:ii) = record(jj:jj)
        endif
      end do ! jj

!     Set flag to parse expression

      flgco = coflg
      coflg = .true.
      call setval(xxx,75,td(1))
      coflg = flgco
      starnd = nint(td(1))
      write(iow,2007) starnd
      if(ior.lt.0) then
        write(*,2007) starnd
      endif
      go to 100

!     [*ele] - Number to add to all input and generated elements

44    j = index(record,'=')
      if(j.eq.0) then
        j = index(record,',')
      endif
      xxx(1:75) = ' '
      ii = 0
      do jj = j+1,75
        if(record(jj:jj).ne.' ') then
          ii = ii + 1
          xxx(ii:ii) = record(jj:jj)
        endif
      end do ! jj

!     Set flag to parse expression

      flgco = coflg
      coflg = .true.
      call setval(xxx,75,td(1))
      coflg = flgco
      starel = nint(td(1))
      write(iow,2008) starel
      if(ior.lt.0) then
        write(*,2008) starel
      endif
      go to 100

!     [peri]odic hill  Hill-Mandel form
!     [peri]odic off   Turn off periodic b.c.

45    if(pcomp(tx(2),'hill',4)) then
        write(iow,2009) head,'Hill-Mandel'
        perflg = .true.
      call periodbc(prt)
      elseif(pcomp(tx(2),'off',3)) then
        perflg = .false.
        write(iow,2010)
      else
        write(iow,2009) head,'ERROR'
        call plstop(.true.)
      endif
      go to 100

!     [manu],hlplev - set Manual help options level
46    read(yyy,1001,err=110,end=900) cc,hlplev
      hlplev = max(-1,min(3,hlplev))
      go to 100

!     [lbou]nd <set,add>
47    lbcfl = .true.
      fext  = 'lb0'
      nlbou = nlbou + 1
      if(.not.pcomp(c2,'set',3)) then
        c2 = 'add'                 ! default mode 'add' for edge force
      endif

      if(ior.lt.0) write(*,*) ' LBOU: ne dof'
      call plinka(fext,c2)
      go to 100

!     [end] of mesh data inputs
48    if(lsave) then
        write(iow,3006)
        if(ior.lt.0) then
          write(iow,3006)
        endif
        error = .true.
      endif

      if(error) then
        call plstop(.true.)

      elseif(iii.ge.0) then

!       Perform delayed mesh generation steps

        if(numbd.gt.0 .and. iii.ge.0) then
          call pblendm(isd,ibn,ndm,nen1,prt,prth,.true.,.true.)
        endif

      endif
      return

!     [mesn] -> user defined mesh inputs

91    n   = i + numesh - list
      uct = wd(i)
      call umshlib(n,tx,prt)
      go to 100

!     End of file encountered

900   call  endclr ('PMESH ',cc)
      call plstop(.true.)

!     Formats

1001  format(a4,11x,2i15)

2000  format(' Enter "help" for list of commands, "end" to exit'/
     &       '     Mesh ',i3,'> ',$)
2001  format(' -> Region Number:',i4,' Maximum:',i4)
2002  format(' Coordinate transformation origin set to:'/
     &       '   x0 =',1p,e12.4:,'  y0 =',1p,e12.4:,'  z0 =',1p,e12.4)
2007  format(' -> Number to be added to all nodal   inputs =',i8)
2008  format(' -> Number to be added to all element inputs =',i8)
2009  format(/1x,19a4,a3/
     &       /5x,'Periodic boundary condition type: ',a)
2010  format(/5x,'Periodic boundary condition off')

3000  format(' *ERROR*  Illegal blend number: numbl=',i5:,a)
3001  format(' *ERROR*  Cannot regenerate SIDEs')
3002  format(' *ERROR*  Cannot regenerate SNODes')
3003  format(' *ERROR*  Cannot regenerate BLENds')
3004  format(' *WARNING* Initial node/element numbers necessary to'
     &      ,' use BLOCk in solution mode.')
3006  format(' *ERROR* No SAVE,END statement for input data.')

      end subroutine pmesh
