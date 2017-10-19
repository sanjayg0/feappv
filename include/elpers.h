
      real*8          gradu     ,epsc     ! Gradient of displacement
      common /elpers/ gradu(3,3),epsc(9)

      real*8          ptau   ,pctau       ! Recovered stress & tangent
      common /elpers/ ptau(6),pctau(6,6)

      real*8          gradt   ,pflux   ,pcflux      ! Thermal properties
      common /elpers/ gradt(3),pflux(3),pcflux(3,3)

      real*8          xc   ,xc0   ,volm0  ! RVE Size
      common /elpers/ xc(3),xc0(3),volm0

      real*8          fdet, opar, ttemp
      common /elpers/ fdet, opar, ttemp

      integer         dsend, drecv
      common /elpers/ dsend, drecv

      integer         prtype              ! Problem type
      common /elpers/ prtype

      logical         finflg              ! Finite deformation (true)
      common /elpers/ finflg

      logical         filflg              ! File inputs if     (true)
      common /elpers/ filflg

      character       hillfile*128
      common /elperc/ hillfile
