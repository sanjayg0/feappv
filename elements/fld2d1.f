!$Id:$
      subroutine fld2d1(d,ul,xl,ix,s,r,ndf,ndm,nst,isw)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2017: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose:  2-D Finite Deformation Elasticity Routine
!                Remark: This is a standard displacement model

!      Inputs:
!         d(*)      - Material set parameters
!         ul(ndf,*) - Nodal solution parameters for element
!         xl(ndm,*) - Nodal coordinates for element
!         ix(*)     - Element nodal connection list
!         ndf       - Number dof/node
!         ndm       - Spatial dimension of mesh
!         nst       - Dimension of element arrays
!         isw       - Switch to control action

!      Outputs:
!         s(nst,*)  - Element matrix
!         p(nst)    - Element vector
!-----[--.----+----.----+----.-----------------------------------------]

      implicit  none

      include  'debugs.h'
      include  'bdata.h'
      include  'cdata.h'
      include  'eldata.h'
      include  'elengy.h'
      include  'elplot.h'
      include  'eltran.h'
      include  'hdata.h'
      include  'iofile.h'
      include  'pmod2d.h'
      include  'prstrs.h'
      include  'ptdat6.h'
      include  'qudshp.h'
      include  'comblk.h'

      integer   ndf,ndm,nst,isw
      integer   i,i1, j,jj,j1, l, nn,nhv, istrt

      real*8    bdb,bd3,dl,dc,di,dvol0,dvol,dmas0, jac0
      real*8    cfac,lfac,xx1,xx2,xx3,yy1, tempi, ta

      integer   ix(*)
      real*8    d(*),ul(ndf,nen,*),xl(ndm,*),s(nst,*)
      real*8    r(ndf,*),r1(3,64),al(2),ac(2),vl(2)
      real*8    bbd(4,2),bb(6),shpr(64)
      real*8    df(3,3,64),f(9,2,64),detf(2,64)
      real*8    ds(6,6,5),dd(6,6),sigv(9),sigl(9,64)

      save

      data      lint / 0 /
      data      f    /1152*0.0d0 /

!     TEMPORARY SET OF TEMPERATURE VALUE

      data      ta   /    0.0d0/

!     No action for isw = 1

      if(isw.eq.1) return

!     Set quadrature and go to process isw

      call quadr2d(d,.true.)

      if(debug) call mprint(sg2,3,lint,3,'SG2')

!     COMPUTE TANGENT STIFFNESS AND RESIDUAL FORCE VECTOR

!     Compute shape functions and derivatives in reference configuration

      do l = 1,lint
        call interp2d(l, xl,ix,ndm,nel, .false.)

        if(debug) call mprint(shp2(1,1,l),3,nel,3,'SHP')
      end do
      if(debug) call mprint(jac,1,lint,1,'JAC')

!     Compute deformation gradient and determinant; transform shape
!     functions to current configuration.

      do l = 1,lint
        call kine2d(shp2(1,1,l),xl,ul,f(1,1,l),df(1,1,l),
     &              detf(1,l),ndm,ndf,nel,nen)
      end do

!     Integration order set to static

      if(d(7).lt.0.0d0) then
        cfac = 0.0d0
        lfac = 0.0d0
      else
        cfac = d(7)
        lfac = 1.0d0 - cfac
      endif

      nhv   = nint(d(15))
      istrt = nint(d(84))

      if(mod(isw,4).eq.0) go to 4

!     LOOP OVER GAUSS POINTS

      nn = 0
      do l = 1,lint

!       Set reference coordinates

        xx1 = 0.0d0
        xx2 = 0.0d0
        do i = 1,nel
          xx1 = xx1 + shp2(3,i,l)*xl(1,i)
          xx2 = xx2 + shp2(3,i,l)*xl(2,i)
        end do

!       Check for axisymmetry

        if(stype.eq.3) then
          jac0  = jac(l)
          dvol0 = jac0*xx1
          do i = 1,nel
            shpr(i) = shp2(3,i,l)/xx1
          end do ! i
        else
          jac0  = 0.0d0
          dvol0 = jac(l)
          do i = 1,nel
            shpr(i) = 0.0d0
          end do ! i
        end if
        dvol  = dvol0*detf(1,l)
        dmas0 = dvol0*d(4)

!       Compute Cauchy stresses and spatial tangent tensor

        call modlfd(l,d,f(1,1,l),df(1,1,l),detf(1,l),ta,
     &             hr(nn+nh1),hr(nn+nh2),nhv,istrt,ds,sigv,bb,
     &             .false.,isw)

        if(isw.eq.13) then

          epl(8) = epl(8) + estore*dvol0

!         Compute velocity at point

          vl(1) = shp2(3,1,l)*ul(1,1,4) + shp2(3,2,l)*ul(1,2,4)
     &          + shp2(3,3,l)*ul(1,3,4) + shp2(3,4,l)*ul(1,4,4)

          vl(2) = shp2(3,1,l)*ul(2,1,4) + shp2(3,2,l)*ul(2,2,4)
     &          + shp2(3,3,l)*ul(2,3,4) + shp2(3,4,l)*ul(2,4,4)

          tempi = 0.0d0
          do i = 1,nel
            tempi = tempi
     &            + (ul(1,i,4)**2 + ul(2,i,4)**2)*shp2(3,i,l)
          end do ! i

!         Accumulate kinetic energy

          epl(7) = epl(7) + 0.5d0*(lfac*tempi
     &                    + cfac*(vl(1)**2 + vl(2)**2))*dmas0

        elseif(isw.ne.14) then

!       Store stress values for tplot

        j1 = 6*(l-1)
        do j = 1,4
          tt(j+j1) = sigv(j)
        end do

!       Multiply tangent moduli and stresses by volume element.

        do i = 1,4
          sigv(i) = sigv(i)*dvol
          do j = 1,4
            dd(i,j) = ds(i,j,1)*dvol*ctan(1)
          end do
        end do

!       Compute accelerations

        al(1) = cfac*(shp2(3,1,l)*ul(1,1,5) + shp2(3,2,l)*ul(1,2,5)
     &              + shp2(3,3,l)*ul(1,3,5) + shp2(3,4,l)*ul(1,4,5))

        al(2) = cfac*(shp2(3,1,l)*ul(2,1,5) + shp2(3,2,l)*ul(2,2,5)
     &              + shp2(3,3,l)*ul(2,3,5) + shp2(3,4,l)*ul(2,4,5))

!       COMPUTE STRESS DIVERGENCE AND INERTIA TERMS

        xx1 = xx1*d(65)**2
        xx2 = xx2*d(65)**2

        do i = 1,nel

!         Compute inertial and body load effects

          ac(1)   = (al(1) + lfac*ul(1,i,5))*dmas0
     &            -  d(11)*dvol0 - xx1*dmas0
          ac(2)   = (al(2) + lfac*ul(2,i,5))*dmas0
     &            -  d(12)*dvol0 - xx2*dmas0

!         Stress divergence term (used in geometric stiffness)

          r1(1,i) = shp2(1,i,l)*sigv(1) + shp2(2,i,l)*sigv(4)
          r1(2,i) = shp2(1,i,l)*sigv(4) + shp2(2,i,l)*sigv(2)

!         Element residual

          r(1,i) = r(1,i) - r1(1,i) - ac(1)*shp2(3,i,l)
     &                    - shpr(i)*sigv(3)
          r(2,i) = r(2,i) - r1(2,i) - ac(2)*shp2(3,i,l)

        end do

!       COMPUTE K (s(nst,nst) = K)

        if(isw.eq.3) then

!         PART 1. - Geometric and inertial part.

          dc  = cfac*ctan(3)*dmas0
          dl  = lfac*ctan(3)*dmas0
          i1  = 0
          do i = 1,nel

            do jj = 1,2
              s(i1+jj,i1+jj) = s(i1+jj,i1+jj) + shp2(3,i,l)*dl
            end do

            di  = dc*shp2(3,i,l)

!           Include geometric stiffness

            if(gflag) then
              bd3 = shpr(i)*sigv(3)*ctan(1)
              j1  = 0
              do j = 1,i
                bdb          = (r1(1,i)*shp2(1,j,l)
     &                       +  r1(2,i)*shp2(2,j,l))*ctan(1)
     &                       +       di*shp2(3,j,l)
                s(i1+1,j1+1) = s(i1+1,j1+1) + bdb + bd3*shpr(j)
                s(i1+2,j1+2) = s(i1+2,j1+2) + bdb
                j1 = j1 + ndf
              end do

!           Include inertia only

            else
              j1  = 0
              do j = 1,i
                bdb          = di*shp2(3,j,l)
                s(i1+1,j1+1) = s(i1+1,j1+1) + bdb
                s(i1+2,j1+2) = s(i1+2,j1+2) + bdb
                j1 = j1 + ndf
              end do
            endif

            i1 = i1 + ndf
          end do

!         PART 2. - Tangent modulus part (based upon dd-array)

          i1 = 0
          do i  = 1,nel

!           Compute bmat-t * dd * dvol

            do jj = 1,4

              bbd(jj,1) = shp2(1,i,l)*dd(1,jj)
     &                  + shpr(  i  )*dd(3,jj)
     &                  + shp2(2,i,l)*dd(4,jj)

              bbd(jj,2) = shp2(1,i,l)*dd(4,jj)
     &                  + shp2(2,i,l)*dd(2,jj)

            end do ! jj

!           Compute tangent stiffness

            j1 = 0
            do j  = 1,i

              s(i1+1,j1+1) = s(i1+1,j1+1) + bbd(1,1)*shp2(1,j,l)
     &                                    + bbd(3,1)*shpr(  j  )
     &                                    + bbd(4,1)*shp2(2,j,l)

              s(i1+2,j1+1) = s(i1+2,j1+1) + bbd(1,2)*shp2(1,j,l)
     &                                    + bbd(3,2)*shpr(  j  )
     &                                    + bbd(4,2)*shp2(2,j,l)

              s(i1+1,j1+2) = s(i1+1,j1+2) + bbd(4,1)*shp2(1,j,l)
     &                                    + bbd(2,1)*shp2(2,j,l)

              s(i1+2,j1+2) = s(i1+2,j1+2) + bbd(4,2)*shp2(1,j,l)
     &                                    + bbd(2,2)*shp2(2,j,l)

              j1 = j1 + ndf
            end do

            i1 = i1 + ndf
          end  do

        endif ! end of tangent

        endif ! end of isw options

        nn = nn + nhv

      end do

      if(isw.eq.3) then

!       Compute upper part by symmetry

        do j = 1,nst
          do i = 1,j
            s(i,j) = s(j,i)
          end do
        end do

        if(debug) then
          call mprint(r,ndf,nel,ndf,'Resid')
          call mprint(s,nst,nst,nst,'Stiff')
        endif

      endif

      return

!     OUTPUT STRESSES

   4  xx1  = 0.d0
      xx2  = 0.d0
      xx3  = 0.d0
      do i = 1,6
        sigv(i) = 0.0d0
      end do ! i

!     LOOP OVER GAUSS POINTS

      nn = 0

      do l = 1,lint

!       Compute Cauchy stresses and spatial tangent tensor at t-n+1

        call modlfd(l,d,f(1,1,l),df(1,1,l),detf(1,l),ta,
     &             hr(nn+nh1),hr(nn+nh2),nhv,istrt,ds,sigl(1,l),bb,
     &             .false.,isw)

        yy1 = 1.d0/dble(nel)
        do i=1,nel
          tempi = yy1 * shp2(3,i,l)
          xx1   = xx1 + tempi*xl(1,i)
          xx2   = xx2 + tempi*xl(2,i)
        end do

!       Compute average stresses and jacobian for printing

        do i = 1,4
          sigv(i) = sigv(i) + yy1 * sigl(i,l)
        end do

        nn = nn + nhv

      end do

!     OUTPUT STRESSES

      if(isw.eq.4) then
        mct = mct - 2
        if(mct.le.0) then
          write(iow,2001) o,head
          if(ior.lt.0) write(*,2001) o,head
          mct = 50
        endif

        write(iow,2002) n,ma,(sigv(jj),jj=1,6),xx1,xx2,xx3
        if(ior.lt.0) then
          write(*,2002) n,ma,(sigv(jj),jj=1,6),xx1,xx2,xx3
        end if

      elseif(isw.eq.8) then

!       Project stress values to nodes

        call stcn2d(ix,sigl,shp2,jac,hr(nph),hr(nph+numnp),hr(ner),
     &              erav,lint,nel,9,numnp)

      end if

!     Format statements

2001  format(a1,20a4//5x,'Element Stresses'//'  Elmt  Matl',
     1   '  11-stress  22-stress  33-stress  12-stress',
     2   '  23-stress  13-stress'/16x,'1-coord    2-coord    3-coord ')

2002  format(2i6,1p,6e11.3/12x,1p,6e11.3/12x,0p,3f11.5)

      end
