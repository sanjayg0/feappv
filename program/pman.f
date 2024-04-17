!$Id:$
      subroutine pman(c_name,nn)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2024: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!     Modification log                                Date (dd/mm/year)
!       Original version                                    16/04/2024
!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Output user information as help

!      Inputs:
!         c_name    - Name of command to display
!         nn        - Type of command: 1=mesh, 2=solution, 3=plot

!      Outputs:
!         To screen
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      include  'iofile.h'

      character(len=12) :: htype(3)
      character(len=4)  :: c_name

      integer       :: nn

      save

      data      htype /'Mesh','Solution','Plot'/

!     Echo request
      if(ior.lt.0) then
        write(*,2001) htype(nn),c_name
      endif

!     Set for Mesh
      if(    nn.eq.1) then

        call pman_mesh(c_name)

!     Set for Solution Language
      elseif(nn.eq.2) then

        call pman_macr(c_name)

!     Set for Plot
      elseif(nn.eq.3) then

        call pman_plot(c_name)

!     Error
      else
        write(*,2002) c_name
      endif

!     Formats

2001  format(/4x,'Help requested for ',a,': ',a/)

2002  format(/4x,'No help available for ',a)

      end subroutine pman

      subroutine pman_mesh(c_name)

      implicit   none

      character (len=4) :: c_name*4

      logical        :: pcomp

      if(pcomp(c_name,'coor',4)) then

      elseif(pcomp(c_name,'elem',4)) then

      elseif(pcomp(c_name,'mate',4)) then

      elseif(pcomp(c_name,'boun',4)) then

      elseif(pcomp(c_name,'forc',4)) then

      elseif(pcomp(c_name,'temp',4)) then

      elseif(pcomp(c_name,'ene',3)) then

      elseif(pcomp(c_name,'prin',4)) then

      elseif(pcomp(c_name,'nopr',4)) then

      elseif(pcomp(c_name,'titl',4)) then

      elseif(pcomp(c_name,'bloc',4)) then

      elseif(pcomp(c_name,'polal',4)) then

      elseif(pcomp(c_name,'ebou',4)) then

      elseif(pcomp(c_name,'angl',4)) then

      elseif(pcomp(c_name,'sloa',4)) then

      elseif(pcomp(c_name,'cons',4)) then

      elseif(pcomp(c_name,'sphe',4)) then

      elseif(pcomp(c_name,'btem',4)) then

      elseif(pcomp(c_name,'icon',4)) then

      elseif(pcomp(c_name,'pars',4)) then

      elseif(pcomp(c_name,'nopa',4)) then

      elseif(pcomp(c_name,'trib',4)) then

      elseif(pcomp(c_name,'para',4)) then

      elseif(pcomp(c_name,'efor',4)) then

      elseif(pcomp(c_name,'eang',4)) then

      elseif(pcomp(c_name,'cbou',4)) then

      elseif(pcomp(c_name,'cfor',4)) then

      elseif(pcomp(c_name,'cang',4)) then

      elseif(pcomp(c_name,'foll',4)) then

      elseif(pcomp(c_name,'slav',4)) then

      elseif(pcomp(c_name,'rese',4)) then

      elseif(pcomp(c_name,'sblo',4)) then

      elseif(pcomp(c_name,'curv',4)) then

      elseif(pcomp(c_name,'rota',4)) then

      elseif(pcomp(c_name,'setn',4)) then

      elseif(pcomp(c_name,'setr',4)) then

      elseif(pcomp(c_name,'btra',4)) then

      elseif(pcomp(c_name,'fpro',4)) then

      elseif(pcomp(c_name,'cpro',4)) then

      elseif(pcomp(c_name,'regi',4)) then

      elseif(pcomp(c_name,'tran',4)) then

      elseif(pcomp(c_name,'damp',4)) then

      elseif(pcomp(c_name,'mass',4)) then

      elseif(pcomp(c_name,'stif',4)) then

      elseif(pcomp(c_name,'csur',4)) then

      elseif(pcomp(c_name,'ereg',4)) then

      elseif(pcomp(c_name,'reac',4)) then

      elseif(pcomp(c_name,'manu',4)) then

      elseif(pcomp(c_name,'body',4)) then

      elseif(pcomp(c_name,'glob',4)) then

      elseif(pcomp(c_name,'shif',4)) then

      elseif(pcomp(c_name,'disp',4)) then

      elseif(pcomp(c_name,'edis',4)) then

      elseif(pcomp(c_name,'cdis',4)) then

      elseif(pcomp(c_name,'debu',4)) then

      elseif(pcomp(c_name,'side',4)) then

      elseif(pcomp(c_name,'face',4)) then

      elseif(pcomp(c_name,'snod',4)) then

      elseif(pcomp(c_name,'blen',4)) then

      elseif(pcomp(c_name,'move',4)) then

      elseif(pcomp(c_name,'rigi',4)) then

      elseif(pcomp(c_name,'moda',4)) then

      elseif(pcomp(c_name,'flex',4)) then

      elseif(pcomp(c_name,'base',4)) then

      elseif(pcomp(c_name,'epro',4)) then

      elseif(pcomp(c_name,'mpro',4)) then

      elseif(pcomp(c_name,'loop',4)) then

      elseif(pcomp(c_name,'next',4)) then

      elseif(pcomp(c_name,'file',4)) then

      elseif(pcomp(c_name,'cdam',4)) then

      elseif(pcomp(c_name,'cmas',4)) then

      elseif(pcomp(c_name,'csti',4)) then

      elseif(pcomp(c_name,'ebas',4)) then

      elseif(pcomp(c_name,'cbas',4)) then

      elseif(pcomp(c_name,'eule',4)) then

      elseif(pcomp(c_name,'ceul',4)) then

      elseif(pcomp(c_name,'rfor',4)) then

      elseif(pcomp(c_name,'lfor',4)) then

      elseif(pcomp(c_name,'load',4)) then

      elseif(pcomp(c_name,'swee',4)) then

      elseif(pcomp(c_name,'spin',4)) then

      elseif(pcomp(c_name,'peri',4)) then

      elseif(pcomp(c_name,'expl',4)) then

      elseif(pcomp(c_name,'filt',4)) then

        write(*,*) '   FILTer <REGIon,MATErial,OFF> num'
        write(*,*) '          num = filter number'
        write(*,*) '          This allows E commands to consider one',
     &             ' part only'

      elseif(pcomp(c_name,'vert',4)) then

      elseif(pcomp(c_name,'emat',4)) then

      endif

      write(*,*) ' '

      end subroutine pman_mesh

      subroutine pman_macr(c_name)

      implicit   none

      character (len=4) :: c_name*4

      logical        :: pcomp

!     PMACR1:

      if(pcomp(c_name,'flux',4)) then

        write(*,*) '   flux,,k1,k2,k3         : Element fluxes'
        write(*,*) '   flux all               : All element fluxes'

      elseif(pcomp(c_name,'stre',4)) then

        write(*,*) '   stre,,k1,k2,k3         : Element stresses'
        write(*,*) '   stre all               : Element stresses'
        write(*,*) '   stre node k1 k2 k3     : Nodal stresses'
        write(*,*) '   stre gnod k1 k2 k3     : Nodal stresses'
        write(*,*) '   stre cnod k1 k2 k3     : Nodal stresses'
        write(*,*) '   stre coor d  x_d xtol  : Nodal stresses'
        write(*,*) '   stre cerr k1,k2 k3'
        write(*,*) '   stre erro k1 k2 k3'
        write(*,*) '   stre cont k1 k2 k3     : Contact tractions'
        write(*,*) '   stre aver'

      elseif(pcomp(c_name,'tang',4)) then

        write(*,*) '   tang: form symmetric tangent'
        write(*,*) '   tang,,1: form rhs and solve.'
        write(*,*) '   tang,,-1: form and assemble unfactored tangent'
        write(*,*) '   tang line 1 shift,value: line search on value'
        write(*,*) '   tang eigv 0 shift: with no mass/damping added'

      elseif(pcomp(c_name,'utan',4)) then

        write(*,*) '   utan: form unsymmetric tangent'
        write(*,*) '   utan,,1: form rhs and solve.'
        write(*,*) '   utan line,1,shift,value: line search on value'

      elseif(pcomp(c_name,'form',4)) then

        write(*,*) '   form long: format outputs for extra digits'
        write(*,*) '   form shor: format outputs normal outputs.'
        write(*,*) ' '
        write(*,*) '   form: form rhs residual'
        write(*,*) '   form acce: initial acceleration'
        write(*,*) '   form expl: explicit solution with lumped mass'
        write(*,*) '   form conv: check residual for convergence'
        write(*,*) '   form stre: update history only'

      elseif(pcomp(c_name,'mass',4)) then

        write(*,*) '   mass lump: Lumped mass matrix used'
        write(*,*) '   mass cons: Consistent  mass matrix used'
        write(*,*) '   mass unsy: Unsymmetric mass matrix used'
        write(*,*) '   mass     : Same as consistent'

      elseif(pcomp(c_name,'reac',4)) then

        write(*,*) '   reac,,k1 k2 k3: output reactions'
        write(*,*) '   reac all: output all reactions'
        write(*,*) '   reac coor nxt xt xtol: at coordinate xt'
        write(*,*) '   reac node x1 x2 x3: at node (x1,x2,x3)'
        write(*,*) '   reac imag k1 k2 k3: complex imaginary'
        write(*,*) '   reac list k1: reactions for list k1'
        write(*,*) '   reac regi k1 k2: reactions for region k1'
        write(*,*) '   reac file: reactions to file fsav.rea'
        write(*,*) '   reac nopr: prevents any prints'

      elseif(pcomp(c_name,'chec',4)) then

        write(*,*) '   chec: check mesh for errors'
        write(*,*) '   chec init: check history data base changes'

      elseif(pcomp(c_name,'damp',4)) then

        write(*,*) '   damp: form consistent damping matrix'

      elseif(pcomp(c_name,'augm',4)) then

        write(*,*) '   augm,,value: value is factor on penalty'
        write(*,*) '   augm pena value: reset penalty parameter'

      elseif(pcomp(c_name,'geom',4)) then

        write(*,*) '   geom: geometric stiffness for eigenvalues'
        write(*,*) '   geom on/off: nonlinear geometric stiffness'

      elseif(pcomp(c_name,'dire',4)) then

        write(*,*) '   direct: profile solver (in-core)'
        write(*,*) '   direct block: profile solver (out of core)'
        write(*,*) '   direct sparse: sparse (in-core) symmetric'

      elseif(pcomp(c_name,'iter',4)) then

        write(*,*) '   iter: iterative: solver (in-core)'
        write(*,*) '   iter tol value: set convergence tolerance'

      elseif(pcomp(c_name,'solv',4)) then

        write(*,*) '   solv: solve equations'
        write(*,*) '   solv,line,value: line search for ratios > value'

      elseif(pcomp(c_name,'dsol',4)) then

        write(*,*) '   dsolve: solve with diagonal matrix'

      elseif(pcomp(c_name,'hill',4)) then

        write(*,*) '   hill-mandel computations'
        write(*,*) '   hill tang:  Compute tangent and stress'
        write(*,*) '   hill stre:  Compute stress only'
        write(*,*) '   hill read:  Read record from file'
        write(*,*) '   hill clos:  Close file'

!     PMACR2:

      elseif(pcomp(c_name,'tol',3)) then

        write(*,*) '   tol,,eval rval: energy (eval) residual (rval)'
        write(*,*) '   tol ener eval: energy (eval)'
        write(*,*) '   tol emax eval: max energy convergence to emax'
        write(*,*) '   tol iter itol atol: residual & absolute tols'

      elseif(pcomp(c_name,'dt',2)) then

        write(*,*) '   dt,,value: size of time increment'

      elseif(pcomp(c_name,'loop',4)) then

        write(*,*) '   loop,,number: perform number loops to next'
        write(*,*) '   loop,infinite: exit controlled by solution'

      elseif(pcomp(c_name,'next',4)) then

        write(*,*) '   next: termination of loop pair'

      elseif(pcomp(c_name,'prop',4)) then

        write(*,*) '   prop,,num1: input proportional function num1'
        write(*,*) '   prop,,num1,num2: proportional loads num1 to num2'
        write(*,*) '   prop,off: proportional loading, remove tables'

      elseif(pcomp(c_name,'time',4)) then

        write(*,*) '   time,,<tmax>: Advance time by dt'
        write(*,*) '                 quit after time > tmax'
        write(*,*) '   time,set,ttim_new: Time set to ttim_new'
        write(*,*) '   time,expl,<tmax>,c: Explicit critical time'
        write(*,*) '                        dt = c * dt_cr'

      elseif(pcomp(c_name,'prin',4)) then

        write(*,*) '   prin data: data from inputs output'
        write(*,*) '   prin command: solution commands on screen'
        write(*,*) '   prin,less: Prints shorter prompts to screen'
        write(*,*) '   prin <mass,cmas,geom>: output mass diagonal'
        write(*,*) '   prin <iden,lmas>: output identity/lump mass'
        write(*,*) '   prin,<tang,utan>: output tangent diagonals'
        write(*,*) '   prin,resi: output residual array'

      elseif(pcomp(c_name,'nopr',4)) then

        write(*,*) '   nopr data: data from inputs not output'
        write(*,*) '   nopr command: no solution commands on screen'
        write(*,*) '   nopr,less: Prints longer prompts to screen'

      elseif(pcomp(c_name,'tran',4)) then

        write(*,*) '   trans xxxx beta gamma alpha: transient solve'
        write(*,*) '       - xxxx = off:  Static solution'
        write(*,*) '       - xxxx = back: Backward Euler'
        write(*,*) '       - xxxx = bdf2: Backward difference 2'
        write(*,*) '       - xxxx = cent: Central difference explicit'
        write(*,*) '       - xxxx = gen1  Generalized midpoint 1'
        write(*,*) '       - xxxx = eule: Euler implicit'
        write(*,*) '       - xxxx = expl: Explicit Newmark'
        write(*,*) '       - xxxx = forw: Forward Euler'
        write(*,*) '       - xxxx = hht:  Hilber-Hughes-Taylor'
        write(*,*) '       - xxxx = newm: Newmark method'
        write(*,*) '       - xxxx = stat: Static midpoint'
        write(*,*) '       - xxxx = user: User supplied'

      elseif(pcomp(c_name,'init',4)) then

        write(*,*) '   init disp: set initial displacements'
        write(*,*) '   init rate: set initial rates'
        write(*,*) '   init velo: set initial velocity (same as rate)'
        write(*,*) '   init acce: set initial accelerations'
        write(*,*) '   init spin omg1 omg2 omg3: - set initial spins'
        write(*,*) '   init mate v1 v2 v3: velocity for material'
        write(*,*) '   init regi v1 v2 v3: velocity for region'

      elseif(pcomp(c_name,'iden',4)) then

        write(*,*) '   iden,,n1,n2: set dof n1 to n2 to unity'
        write(*,*) '                used as mass eigen matrix'

      elseif(pcomp(c_name,'newf',4)) then

        write(*,*) '   newf; set F0 to current force vector'
        write(*,*) '   newf zero: Set F0 to zero'

      elseif(pcomp(c_name,'back',4)) then

        write(*,*) '   back,,dt: back-up to beginning of time'
        write(*,*) '             step, set new dt'

      elseif(pcomp(c_name,'debu',4)) then

        write(*,*) '   debug <on,off> level: turn on/off debug prints'

      elseif(pcomp(c_name,'if',2)) then

        write(*,*) '   if expression: Start of if/else/endif'
        write(*,*) '     -expression controls use'

      elseif(pcomp(c_name,'else',4)) then

        write(*,*) '   else expression: Structure if/else/endif'
        write(*,*) '       -expression controls use'

      elseif(pcomp(c_name,'endi',4)) then

        write(*,*) '   endif: End of if/else/endif'

      elseif(pcomp(c_name,'echo',4)) then

        write(*,*) '   echo <on/off>: batch solution commands appear'
        write(*,*) '                  to screen if on'

!     PMACR3:

      elseif(pcomp(c_name,'disp',4)) then

        write(*,*) '   disp,all: output all nodal displacements'
        write(*,*) '   disp,,k1,k2,k3: output displ. k1 to k2 step k3'
        write(*,*) '   disp,gnod,k1,k2,k3: output displ. for global'
        write(*,*) '                       nodes k1 to k2 step k3'
        write(*,*) '   disp,coor,k1,xt,xtol; output displ. all nodes'
        write(*,*) '                         where x-k1=xt-xtol'
        write(*,*) '   disp,node,x1,x2,x3: output displ. for node'
        write(*,*) '                       closest to x1,x2,x3'
        write(*,*) '   disp,imag,k1,k2,k3: output all imaginary'
        write(*,*) '   disp,cmpl,k1,k2,k3: output real/imag (polar)'
        write(*,*) '   disp,comp,k1,k2,k3: output real/imag (Cart)'
        write(*,*) '   disp,list,k1: output displacements in list k1'
        write(*,*) '   disp,glob: output all global displacements'
        write(*,*) '   disp,glob,k1,k2,k3: output global k1 to k2 in k3'

      elseif(pcomp(c_name,'velo',4)) then

        write(*,*) '   velo,all: output all nodal velocities'
        write(*,*) '   velo,,k1,k2,k3: output veloc. k1 to k2 step k3'
        write(*,*) '   velo,gnod,k1,k2,k3: output veloc. for global'
        write(*,*) '                       nodes k1 to k2 step k3'
        write(*,*) '   velo,coor,k1,xt,xtol; output veloc. all nodes'
        write(*,*) '                         where x-k1=xt-xtol'
        write(*,*) '   velo,node,x1,x2,x3: output veloc. for node'
        write(*,*) '                       closest to x1,x2,x3'
        write(*,*) '   velo,imag,k1,k2,k3: output all imaginary'
        write(*,*) '   velo,cmpl,k1,k2,k3: output all real/imag'
        write(*,*) '   velo,list,k1: output velocities in list k1'
        write(*,*) '   velo,glob: output all global velocities'
        write(*,*) '   velo,glob,k1,k2,k3: output global k1 to k2 in k3'

      elseif(pcomp(c_name,'acce',4)) then

        write(*,*) '   acce,all: output all nodal accelerations'
        write(*,*) '   acce,,k1,k2,k3: output accel. k1 to k2 step k3'
        write(*,*) '   acce,gnod,k1,k2,k3: output accel. for global'
        write(*,*) '                       nodes k1 to k2 step k3'
        write(*,*) '   acce,coor,k1,xt,xtol; output accel. all nodes'
        write(*,*) '                         where x-k1=xt-xtol'
        write(*,*) '   acce,node,x1,x2,x3: output accel. for node'
        write(*,*) '                       closest to x1,x2,x3'
        write(*,*) '   acce,imag,k1,k2,k3: output all imaginary'
        write(*,*) '   acce,cmpl,k1,k2,k3: output all real/imag'
        write(*,*) '   acce,list,k1: output accelerations in list k1'
        write(*,*) '   acce,glob: output all global accelerations'
        write(*,*) '   acce,glob,k1,k2,k3: output global k1 to k2 in k3'

      elseif(pcomp(c_name,'mesh',4)) then

        write(*,*) '   mesh: Reenter mesh generation phase'
        write(*,*) '   mesh,filename: Read the data from  filename'

      elseif(pcomp(c_name,'opti',4)) then

        write(*,*) '   optimize:  node numbering then reset profile'
        write(*,*) '   opti off:  turn off profile optimization'
        write(*,*) '   opti cont: optimization during contact solution'
        write(*,*) '   opti hoit: Set to use optimizer by Wilson/Hoit'
        write(*,*) '   opti sloan: Set to use Sloan algorithm (default)'

      elseif(pcomp(c_name,'plot',4)) then

        write(*,*) '   plot: enter interactive plot mode'
        write(*,*) '   plot <optn k1 k2 k3>: see plot manual'

      elseif(pcomp(c_name,'subs',4)) then

        write(*,*) '   subs <prin> k1 <k2>: subspace for k1 eigenpairs'
        write(*,*) '                  - k2 number guard vectors'
        write(*,*) '                  - prin ouputs projecte matrices'

      elseif(pcomp(c_name,'writ',4)) then

        write(*,*) '   write fnam: open write file named fnam'
        write(*,*) '   write disp: write displacements to fnam'
        write(*,*) '   write stre: write nodal streses to fnam'
        write(*,*) '   write eige: write eigenpairs to fnam'
        write(*,*) '   write wind: rewind  fnam'
        write(*,*) '   write clos: close  fnam'

      elseif(pcomp(c_name,'read',4)) then

        write(*,*) '   read fnam: open read file named fnam'
        write(*,*) '   read disp: read displacements to fnam'
        write(*,*) '   read stre: read nodal streses to fnam'
        write(*,*) '   read eige: read eigenpairs to fnam'
        write(*,*) '   read wind: rewind  fnam'
        write(*,*) '   read clos: close  fnam'

      elseif(pcomp(c_name,'rest',4)) then

        write(*,*) '   restart ext_name kk: Restart file extension'
        write(*,*) '                        ext_name + kk'

      elseif(pcomp(c_name,'bfgs',4)) then

        write(*,*) '   bfgs,,k1,k2,k3: BFGS soln k1 = no. steps;'
        write(*,*) '                               k2 = line search tol'
        write(*,*) '                               k3 = bfgs energy tol'

      elseif(pcomp(c_name,'arcl',4)) then

        write(*,*) '   arcl,,kflag,lflag: set arc length parameters'
        write(*,*) '   arcl,add,k1,tau: add eigvenvector k1, amount tau'
        write(*,*) '   arcl,chec,k1: check bifurcation using eigv. k1'
        write(*,*) '   arcl,off: set arclength to off'

      elseif(pcomp(c_name,'save',4)) then

        write(*,*) '   save,,k1,k2: save Restart file with extension'
        write(*,*) '                number k1 at k2 intervals'

      elseif(pcomp(c_name,'eige',4)) then

        write(*,*) '   eige <vect k1>: eigenpairs for element k1'
        write(*,*) '   eige <mass k1>: mass eigenvalues for element k1'
        write(*,*) '              k1 <= 0 for last element'
        write(*,*) '   eige,<norm,k1,k2>: - Compute normal modes for k1'
        write(*,*) '              k1 <= 0 for last element'
        write(*,*) '              k2 <= 0 for stiffness'
        write(*,*) '              k2 > 0 for mass'

      elseif(pcomp(c_name,'epri',4)) then

        write(*,*) '   eprint: output element tangent, residual, mass'
        write(*,*) '   epri,,k    : Output stifness & residual for k1'
        write(*,*) '   epri mass k: Output mass for k1'

      elseif(pcomp(c_name,'eigv',4)) then

        write(*,*) '   eigv dofs/dof-list: DOFS for comp (1=on; 0=off)'
        write(*,*) '   eigv all nnn: Output eigenvector nnn (all)'
        write(*,*) '   eigv coor k1 xt nnn: output forr x_k1 = xt'
        write(*,*) '   eigv list k1,nnn: Output nnn using list k1'
        write(*,*) '   eigv nnn k1,k2,k3: Output nnn nd k1-k2 @ inc k3'

!     PMACR4:

!     PMACR5:

      elseif(pcomp(c_name,'outm',4)) then

        write(*,*) '   outm:      Output renumbered input file'
        write(*,*) '   outm cont: Output contact slide-line data'
        write(*,*) '   outm defo: Output renumbered deformed mesh'
        write(*,*) '   outm doma: Output mesh for domains'
        write(*,*) '   outm elem: Output mesh for single element'
        write(*,*) '   outm bina: Output renumbered binarynput file'

      elseif(pcomp(c_name,'show',4)) then

        write(*,*) '   show     : show current solution parameters'
        write(*,*) '   show cont: show user contact types and variables'
        write(*,*) '   show dict: show dictionary of array allocation'
        write(*,*) '   show elem: show user element types'
        write(*,*) '   show mate: show material type use'
        write(*,*) '   show part: show partition data.'
        write(*,*) '   show comm: show content of common files.'
        write(*,*) '              request common filen on prompt'
        write(*,*) '   show incl: show content of common files.'
        write(*,*) '              request include filen on prompt'

!     PMACR6:

      elseif(pcomp(c_name,'tplo',4)) then

        write(*,*) '   tplot,,<interval> - time history plots'
        write(*,*) '   options: disp n1 n2 x y z  n1 = dof'
        write(*,*) '            velo n1 n2 x y z  n2 = node'
        write(*,*) '            acce n1 n2 x y z'
        write(*,*) '            reac n1 n2 x y z'
        write(*,*) '            stre n1 n2 x y z  n1 = component'
        write(*,*) '            hist n1 n2 x y z  n2 = element'
        write(*,*) '            elem n1 n2 x y z'
        write(*,*) '            user n1 n2 x y z'
        write(*,*) '            cont n1 n2 x y z'
        write(*,*) '            arcl n1 n2'
        write(*,*) '            rsum n1 n2'
        write(*,*) '            sums n1 n2'
        write(*,*) '            ener: Energy and momenta'
        write(*,*) '            show: Adds list to output file'

      elseif(pcomp(c_name,'para',4)) then

        write(*,*) '   parameter,name,value: set name to value'

      elseif(pcomp(c_name,'func',4)) then

        write(*,*) '   func,fname: execute function fname'

!     PMACR7:

      elseif(pcomp(c_name,'grap',4)) then

        write(*,*) '   graph <nodes> d: Graph mesh into d domains'
        write(*,*) '   graph file     : Input graph from file'

!     PMACR8:

      elseif(pcomp(c_name,'elev',4)) then

        write(*,*) '   elev: Elevate IgA knot order'
        write(*,*) '         1-d, 2-d & 3-d'
        write(*,*) '          elev block n_blk k_dir inc_order'
        write(*,*) '          elev patch n_pat k_dir inc_order'

      elseif(pcomp(c_name,'inse',4)) then

        write(*,*) '   inse: Insert IgA knot'
        write(*,*) '         1-d'
        write(*,*) '          inse block n_blk u_i n_times'
        write(*,*) '          inse patch n_pat u_i n_times'
        write(*,*) '         2-d & 3-d'
        write(*,*) '          inse block n_blk k_dir u_i n_times'
        write(*,*) '          inse patch n_pat k_dir u_i n_times'

!     PMACR9:

      elseif(pcomp(c_name,'fe2 ',4)) then

        write(*,*) '   fe2 : FE2 analysis switch value'
        write(*,*) '         fe2 sw (switch parameter name)'

      elseif(pcomp(c_name,'rve ',4)) then

        write(*,*) '   rve : RVE for FE2 only'

      endif

      write(*,*) ' '

      end subroutine pman_macr

      subroutine pman_plot(c_name)

      implicit   none

      character (len=4) :: c_name*4

      logical        :: pcomp

!     Commands in PPLOTF

      if(pcomp(c_name,'fram',4)) then

        write(*,*) '   fram ifrm: ifrm = 0 for whole screen'
        write(*,*) '              ifrm = 1 for upper-left'
        write(*,*) '              ifrm = 2 for upper-right'
        write(*,*) '              ifrm = 3 for lower-left'
        write(*,*) '              ifrm = 4 for lower-right'
        write(*,*) '              ifrm = 5 for legend Box'

      elseif(pcomp(c_name,'wipe',4)) then

        write(*,*) '   wipe ifrm: ifrm = 0 for whole screen'
        write(*,*) '              ifrm = 1 for upper-left'
        write(*,*) '              ifrm = 2 for upper-right'
        write(*,*) '              ifrm = 3 for lower-left'
        write(*,*) '              ifrm = 4 for lower-right'
        write(*,*) '              ifrm = 5 for legend Box'

      elseif(pcomp(c_name,'fact',4)) then

        write(*,*) '   fact value: multiply plot by value'

      elseif(pcomp(c_name,'cart',4)) then

        write(*,*) '   cart: cartesian view'

      elseif(pcomp(c_name,'line',4)) then

        write(*,*) '   line,value,width: value is type'
        write(*,*) '                     deviced dependent'

      elseif(pcomp(c_name,'cont',4)) then

        write(*,*) '   contour k1 k2 k3: k1 = solution component'
        write(*,*) ' '
        write(*,*) '                     k2 = 0: fill plots)'
        write(*,*) '                     k3 = 0: superpose mesh'
        write(*,*) '                     k3 > 0: no mesh'
        write(*,*) ' '
        write(*,*) '                     k2 > 0: # line plots'
        write(*,*) '                     k3 > 0: no numbers'

      elseif(pcomp(c_name,'velo',4)) then

        write(*,*) '   velocity k1 k2 k3: k1 = velocity component'
        write(*,*) '                      k2 = # lines (fill if <= 0)'
        write(*,*) '                      k3 = 0: superpose mesh'
        write(*,*) '                      k3 > 0: no mesh'

      elseif(pcomp(c_name,'acce',4)) then

        write(*,*) '   accelerate k1 k2 k3: k1 = component'
        write(*,*) '                        k2 = # lines (fill if <= 0)'
        write(*,*) '                        k3 = 0: superpose mesh'
        write(*,*) '                        k3 > 0: no mesh'

      elseif(pcomp(c_name,'outl',4)) then

        write(*,*) '   outline: outline of mesh region'

      elseif(pcomp(c_name,'load',4)) then

        write(*,*) '   load k1 k2: Plot load vector'
        write(*,*) '               k1 > 0 tip on node'
        write(*,*) '               k1 < 0 tail on node'
        write(*,*) '               k2 scale factor'

      elseif(pcomp(c_name,'disp',4)) then

        write(*,*) '   disp k1 k2: displacement vector'
        write(*,*) '               k1 > 0 tip on node'
        write(*,*) '               k1 < 0 tail on node'
        write(*,*) '               k2 scale factor'

      elseif(pcomp(c_name,'mesh',4)) then

        write(*,*) '   mesh k1: mesh of current material number'
        write(*,*) '            k1 < 0 alters line color'

      elseif(pcomp(c_name,'stre',4)) then

        write(*,*) '   stress  k1 k2 k3: k1 = component to contour'
        write(*,*) ' '
        write(*,*) '                     k2 = 0: fill plots)'
        write(*,*) '                     k3 = 0: superpose mesh'
        write(*,*) '                     k3 > 0: no mesh'
        write(*,*) ' '
        write(*,*) '                     k2 > 0: # line plots'
        write(*,*) '                     k3 > 0: no numbers'

      elseif(pcomp(c_name,'flux',4)) then

        write(*,*) '   flux    k1 k2 k3: k1 = thermal flux'
        write(*,*) '                          component to contour'
        write(*,*) ' '
        write(*,*) '                     k2 = 0: fill plots)'
        write(*,*) '                     k3 = 0: superpose mesh'
        write(*,*) '                     k3 > 0: no mesh'
        write(*,*) ' '
        write(*,*) '                     k2 > 0: # line plots'
        write(*,*) '                     k3 > 0: no numbers'

      elseif(pcomp(c_name,'pstr',4)) then

        write(*,*) '   pstress k1 k2 k3: k1 = component to contour'
        write(*,*) ' '
        write(*,*) '                     k2 = 0: fill plots)'
        write(*,*) '                     k3 = 0: superpose mesh'
        write(*,*) '                     k3 > 0: no mesh'
        write(*,*) ' '
        write(*,*) '                     k2 > 0: # line plots'
        write(*,*) '                     k3 > 0: no numbers'

      elseif(pcomp(c_name,'estr',4)) then

        write(*,*) '   estress k1 k2 k3: k1 = component to contour'
        write(*,*) ' '
        write(*,*) '                     k2 = 0: fill plots)'
        write(*,*) '                     k3 = 0: superpose mesh'
        write(*,*) '                     k3 > 0: no mesh'
        write(*,*) ' '
        write(*,*) '                     k2 > 0: # line plots'
        write(*,*) '                     k3 > 0: no numbers'

      elseif(pcomp(c_name,'node',4)) then

        write(*,*) '   node k1 k2; Plot nodes k1 to k2 & numbers'
        write(*,*) '           k1 = 0 show all nodes &  numbers'
        write(*,*) '           k1 < 0 show all nodes no numbers'

      elseif(pcomp(c_name,'boun',4)) then

        write(*,*) '   boun <k1>: Plot nodes k1 to k2 & numbers'
        write(*,*) '              k1 = 0 restraints up to dof = 3'
        write(*,*) '              k1 > 0 restraints of dof k1'

      elseif(pcomp(c_name,'elem',4)) then

        write(*,*) '   element k1 k2: Plot elmts k1 to k2 numbers'
        write(*,*) '              k1 = k2 = 0, plot all'

      elseif(pcomp(c_name,'zoom',4)) then

        write(*,*) '   zoom k1 k2: Set window between nodes k1 & k2'

      elseif(pcomp(c_name,'colo',4)) then

        write(*,*) '   color k1 k2: set color'
        write(*,*) '         k1 <  0  greyscale postscript'
        write(*,*) '         k1 >= 0  color postscript'
        write(*,*) '         k2 =  0  standard color order'
        write(*,*) '         k2 != 0  reversed color order'

      elseif(pcomp(c_name,'fill',4)) then

        write(*,*) '   fill k1 k2 k3: fill in solid material colors'
        write(*,*) '        k1 = fill current material in color k1'
        write(*,*) '        k2 = Omit Time label if k2 .ne. 0'
        write(*,*) '        k3 = Omit mesh if k3 .ne. 0'

      elseif(pcomp(c_name,'eigv',4)) then

        write(*,*) '   eigv k1 k2 k3: eigenvector k1 & material k2'
        write(*,*) '                  k2 = 0 for all materials'
        write(*,*) '                  k3 = dof to contour'

      elseif(pcomp(c_name,'scal',4)) then

        write(*,*) '   scale cs: Set plot scale to cs'

      elseif(pcomp(c_name,'axis',4)) then

        write(*,*) '   axis x y: plot axis at screen coords (x,y)'

      elseif(pcomp(c_name,'pers',4)) then

        write(*,*) '   pers k1: perspective view'
        write(*,*) '            k1 = 0: at default location'
        write(*,*) '            k1 > 0: input perspective data'

      elseif(pcomp(c_name,'hide',4)) then

        write(*,*) '   hide: hide mesh not visible'

      elseif(pcomp(c_name,'defo',4)) then

        write(*,*) '   deform scale resize escale: deform plots'
        write(*,*) '          scale: displ. multiplier (default=1)'
        write(*,*) '          resize > 0: do not rescale plot'
        write(*,*) '          escale: eigen multiplier (default=1)'

      elseif(pcomp(c_name,'unde',4)) then

        write(*,*) '   undeform,,resize escale: deform plots'
        write(*,*) '          resize > 0: do not rescale plot'
        write(*,*) '          escale: eigen multiplier (default=1)'

      elseif(pcomp(c_name,'post',4)) then

        write(*,*) '   post k1: PostScrip outputs'
        write(*,*) '            k1 = 0: portrait'
        write(*,*) '            k1 = 1: landscape'
        write(*,*) '            give before and after plot'

      elseif(pcomp(c_name,'reac',4)) then

        write(*,*) '   reaction k1 k2: nodal reactions'
        write(*,*) '                   k1 > 0 tip at node'
        write(*,*) '                   k2 = scale value'

      elseif(pcomp(c_name,'mate',4)) then

        write(*,*) '   mate k1: restrict plots to material k1'

      elseif(pcomp(c_name,'dofs',4)) then

        write(*,*) '   dofs k1 k2 k3: set ki > 0 for dof to plot'

      elseif(pcomp(c_name,'prof',4)) then

        write(*,*) '   profile k1: upper profile if k1 = 0'
        write(*,*) '               total profile if k1 > 0'

      elseif(pcomp(c_name,'utot',4)) then

        write(*,*) '   utotal  k1 = no. components to sum squares'
        write(*,*) '           plot square root of sum'
        write(*,*) '                     k2 = 0: fill plots'
        write(*,*) '                     k3 = 0: superpose mesh'
        write(*,*) '                     k3 > 0: no mesh'
        write(*,*) ' '
        write(*,*) '                     k2 > 0: # line plots'
        write(*,*) '                     k3 > 0: no numbers'

      elseif(pcomp(c_name,'prom',4)) then

        write(*,*) '   prompt <on/off>: set gaphics prompts on/off'

      elseif(pcomp(c_name,'defa',4)) then

        write(*,*) '   dafault <on/off>: set gaphics defaults on/off'

      elseif(pcomp(c_name,'rang',4)) then

        write(*,*) '   range pmin pmax: set range of contours between'
        write(*,*) '                    pmin and pmax'

      elseif(pcomp(c_name,'nora',4)) then

        write(*,*) '   norang: turn off range setting'

      elseif(pcomp(c_name,'snod',4)) then

        write(*,*) '   snod,k1,k2:  Plot super nodes'
        write(*,*) '           k1 < 0 show all nodes no numbers'
        write(*,*) '           k1 = 0 show all nodes &  numbers'

      endif
      write(*,*) ' '

      end subroutine pman_plot
