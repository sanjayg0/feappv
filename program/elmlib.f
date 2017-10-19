!$Id:$
      subroutine elmlib(d,u,x,ix,t,s,p,i,j,k,jel,isw)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Element library driver routine
!               N.B. Must set library flags in Subroutine PELNUM
!                    for new program modules

!      Inputs:
!         d(*)    - Material parameters
!         u(*)    - Element solution parameters
!         x(*)    - Element nodal coordinates
!         ix(*)   - Element nodal numbers
!         t(*)    - Element temperatures
!         i       - Number dof/node           (ndf)
!         j       - Spatial dimension of mesh (ndm)
!         k       - Size of element arrays    (nst)
!         jel     - Element type number

!      Outputs:
!         d(*)    - Material parameters (isw = 1 only)
!         s(*,*)  - Element array
!         p(*)    - Element vector
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'eldata.h'
      include  'iofile.h'

      integer   i,j,k,jel,isw
      integer   ix(*)
      real*8    p(*),s(*),d(*),u(*),x(*),t(*)

      save

      if(isw.ge.3 .and. k.gt.0) then
        call pzero(s,k*k)
        call pzero(p,k  )
      endif

      if(jel.gt.0) then

        go to ( 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15), jel
        go to 400

1       call elmt01(d,u,x,ix,t,s,p,i,j,k,isw)
        go to 100
2       call elmt02(d,u,x,ix,t,s,p,i,j,k,isw)
        go to 100
3       call elmt03(d,u,x,ix,t,s,p,i,j,k,isw)
        go to 100
4       call elmt04(d,u,x,ix,t,s,p,i,j,k,isw)
        go to 100
5       call elmt05(d,u,x,ix,t,s,p,i,j,k,isw)
        go to 100
6       call elmt06(d,u,x,ix,t,s,p,i,j,k,isw)
        go to 100
7       call elmt07(d,u,x,ix,t,s,p,i,j,k,isw)
        go to 100
8       call elmt08(d,u,x,ix,t,s,p,i,j,k,isw)
        go to 100
9       call elmt09(d,u,x,ix,t,s,p,i,j,k,isw)
        go to 100
10      call elmt10(d,u,x,ix,t,s,p,i,j,k,isw)
        go to 100
11      call elmt11(d,u,x,ix,t,s,p,i,j,k,isw)
        go to 100
12      call elmt12(d,u,x,ix,t,s,p,i,j,k,isw)
        go to 100
13      call elmt13(d,u,x,ix,t,s,p,i,j,k,isw)
        go to 100
14      call elmt14(d,u,x,ix,t,s,p,i,j,k,isw)
        go to 100
15      call elmt15(d,u,x,ix,t,s,p,i,j,k,isw)
        go to 100

      else

        if(j.eq.1) then

          go to(101,102,103,104,105,106,107,108,109), -jel

          go to 400

!         1-D solid

101       call solid1d(d,u,x,ix,t,s,p,i,j,k,isw)
          go to 100

102       call trussnd(d,u,x,ix,t,s,p,i,j,k,isw)
          go to 100

103       write(*,*) ' No 1-d frame element available.'
          call plstop(.true.)

104       write(*,*) ' No 1-d plate element available.'
          call plstop(.true.)

105       write(*,*) ' No 1-d shell element available.'
          call plstop(.true.)

106       write(*,*) ' No 1-d membrane element available.'
          call plstop(.true.)

107       write(*,*) ' No 1-d thermal element available.'
          call plstop(.true.)

108       write(*,*) ' No 1-d thermal convection element available.'
          call plstop(.true.)

109       call pointnd(d,u,s,p,i,k,isw)
          go to 100

        elseif(j.eq.2) then

          go to(201,202,203,204,205,206,207,208,209), -jel

          go to 400

!         2-D solid

201       call solid2d(d,u,x,ix,t,s,p,i,j,k,isw)
          go to 100

202       call trussnd(d,u,x,ix,t,s,p,i,j,k,isw)
          go to 100

203       call frame2d(d,u,x,ix,s,p,i,j,k,isw)
          go to 100

204       call plate2d(d,u,x,ix,s,p,i,j,k,isw)
          go to 100

205       call shell2d(d,u,x,ix,s,p,i,j,k,isw)
          go to 100

206       write(*,*) ' No 2-d membrane element available.'
          call plstop(.true.)

207       call therm2d(d,u,x,ix,s,p,i,j,k,isw)
          go to 100

208       call convec2d(d,u,x,ix,s,p,i,j,k,isw)
          go to 100

209       call pointnd(d,u,s,p,i,k,isw)
          go to 100

        elseif(j.eq.3) then

          go to(301,302,303,304,305,306,307,308,309), -jel

          go to 400

!         3-D solid

301       call solid3d(d,u,x,ix,t,s,p,i,j,k,isw)
          go to 100

302       call trussnd(d,u,x,ix,t,s,p,i,j,k,isw)
          go to 100

303       call frame3d(d,u,x,ix,s,p,i,j,k,isw)
          go to 100

304       write(*,*) ' No 3-d plate element available: Use SHELL.'
          call plstop(.true.)

305       call shell3d(d,u,x,ix,s,p,i,j,k,isw)
          go to 100

306       call membr3d(d,u,x,ix,s,p,i,j,k,isw)
          go to 100

307       call therm3d(d,u,x,ix,s,p,i,j,k,isw)
          go to 100

308       call convec3d(d,u,x,ix,s,p,i,j,k,isw)
          go to 100

309       call pointnd(d,u,s,p,i,k,isw)
          go to 100

        endif
      endif

100   return

!     Error

400   if(ior.gt.0) write(iow,4000) n,jel
      if(ior.lt.0) write(  *,4000) n,jel
      call plstop(.true.)

!     Format

4000  format('  *ERROR* Element:',i6,', type number',i3,' input')

      end
