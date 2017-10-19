
      integer          num_nps,       num_ups
      parameter       (num_nps = 400, num_ups = 200)

      integer          np         , up                   ! int4
      common /pointer/ np(num_nps), up(num_ups)

      integer          npid,npix,npuu,npxx,nper,npnp,npev,nprn,npty
      common /npoints/ npid,npix,npuu,npxx,nper,npnp,npev,nprn,npty

      integer          npud
      common /npoints/ npud

      integer          plix
      common /ppoints/ plix

