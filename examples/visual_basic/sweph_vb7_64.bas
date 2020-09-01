Attribute VB_Name = "sweph"
'
    ' Swiss Ephemeris Release 1.62  4-jan-2002
    '
    ' Declarations for VBA 7.0
    ' The DLL file must exist in the same directory as the VB executable, or in a system
    ' directory where it can be found at runtime
    '

    ' the DLL returns Null-terminated C strings; for VB the terminating NULL
    ' character must be found and the string length must be set accordingly

    '  Some PtrSafe Functions return a string for them 3 problems must be fixed
    ' 1) plname must be initialized to a string with sufficient space plname = string(20,0)
    '    The parameter must be ByVal plname as String
    ' 2) The PtrSafe Function set_strlen must be used to remove the null character set
    ' 3) The PtrSafe Function returns a pointer which does not exist in VB, so it is not needed, and instead declare
    '    PtrSafe Function as sub, or return Long and Ignore. The String will be returned to the parameter.

     

    Private Declare PtrSafe Function swe_azalt Lib "swedll64.dll" _
        ( _
              ByVal tjd_ut As Double, _
              ByVal calc_flag As Long, _
              ByRef geopos As Double, _
              ByVal atpress As Double, _
              ByVal attemp As Double, _
              ByRef xin As Double, _
              ByRef xaz As Double _
            ) As Long  'geopos must be the first of three array elements
    'xin must be the first of two array elements
    'xaz must be the first of three array elements

    Private Declare PtrSafe Function swe_azalt_rev Lib "swedll64.dll" _
           ( _
              ByVal tjd_ut As Double, _
              ByVal calc_flag As Long, _
              ByRef geopos As Double, _
              ByRef xin As Double, _
              ByRef xout As Double _
            ) As Long  'geopos must be the first of three array elements
    'xin must be the first of two array elements
    'xout must be the first of three array elements

    Private Declare PtrSafe Function swe_calc Lib "swedll64.dll" _
        ( _
              ByVal tjd As Double, _
              ByVal ipl As Long, _
              ByVal iflag As Long, _
              ByRef x As Double, _
              ByVal serr As String _
            ) As Long   ' x must be first of six array elements
    ' serr must be able to hold 256 bytes



    Private Declare PtrSafe Function swe_calc_ut Lib "swedll64.dll" _
       ( _
              ByVal tjd_ut As Double, _
              ByVal ipl As Long, _
              ByVal iflag As Long, _
              ByRef x As Double, _
              ByVal serr As String _
            ) As Long   ' x must be first of six array elements
    ' serr must be able to hold 256 bytes


    Private Declare PtrSafe Function swe_close Lib "swedll64.dll" _
      ( _
            ) As Long


    Private Declare PtrSafe Sub swe_cotrans Lib "swedll64.dll" _
      ( _
              ByRef xpo As Double, _
              ByRef xpn As Double, _
              ByVal eps As Double _
            )


    Private Declare PtrSafe Sub swe_cotrans_sp Lib "swedll64.dll" _
    ( _
              ByRef xpo As Double, _
              ByRef xpn As Double, _
              ByVal eps As Double _
            )


    Private Declare PtrSafe Sub swe_cs2degstr Lib "swedll64.dll" _
        ( _
              ByVal t As Long, _
              ByVal s As String _
            )


    Private Declare PtrSafe Sub swe_cs2lonlatstr Lib "swedll64.dll" _
         ( _
              ByVal t As Long, _
              ByVal pchar As Byte, _
              ByVal mchar As Byte, _
              ByVal s As String _
            )

 

    Private Declare PtrSafe Sub swe_cs2timestr Lib "swedll64.dll" _
     ( _
              ByVal t As Long, _
              ByVal sep As Long, _
              ByVal supzero As Long, _
              ByVal s As String _
            )



    Private Declare PtrSafe Function swe_csnorm Lib "swedll64.dll" _
      ( _
              ByVal p As Long _
            ) As Long


    Private Declare PtrSafe Function swe_csroundsec Lib "swedll64.dll" _
       ( _
              ByVal p As Long _
            ) As Long


    Private Declare PtrSafe Function swe_d2l Lib "swedll64.dll" _
        ( _
            ) As Long


    Private Declare PtrSafe Function swe_date_conversion Lib "swedll64.dll" _
         ( _
              ByVal Year As Long, _
              ByVal Month As Long, _
              ByVal Day As Long, _
              ByVal utime As Double, _
              ByVal cal As Byte, _
              ByRef tjd As Double _
            ) As Long

    Private Declare PtrSafe Function swe_day_of_week Lib "swedll64.dll" _
         ( _
              ByVal jd As Double _
            ) As Long


    Private Declare PtrSafe Function swe_degnorm Lib "swedll64.dll" _
            ( _
              ByVal jd As Double _
            ) As Double

    Private Declare PtrSafe Function swe_deltat Lib "swedll64.dll" _
         ( _
              ByVal jd As Double _
            ) As Double


    Private Declare PtrSafe Function swe_difcs2n Lib "swedll64.dll" _
        ( _
              ByVal p1 As Long, _
              ByVal p2 As Long _
            ) As Long

 
    Private Declare PtrSafe Function swe_difcsn Lib "swedll64.dll" _
         ( _
              ByVal p1 As Long, _
              ByVal p2 As Long _
            ) As Long

 
    Private Declare PtrSafe Function swe_difdeg2n Lib "swedll64.dll" _
        ( _
              ByVal p1 As Double, _
              ByVal p2 As Double _
            ) As Double

    Private Declare PtrSafe Function swe_difdegn Lib "swedll64.dll" _
          ( _
              ByVal p1 As Double, _
              ByVal p2 As Double _
            ) As Long

    Private Declare PtrSafe Function swe_fixstar Lib "swedll64.dll" _
         ( _
              ByVal star As String, _
              ByVal tjd As Double, _
              ByVal iflag As Long, _
              ByRef x As Double, _
              ByVal serr As String _
            ) As Long       ' x must be first of six array elements
    ' serr must be able to hold 256 bytes
    ' star must be able to hold 40 bytes

 
    Private Declare PtrSafe Function swe_fixstar_ut Lib "swedll64.dll" _
           ( _
              ByVal star As String, _
              ByVal tjd_ut As Double, _
              ByVal iflag As Long, _
              ByRef x As Double, _
              ByVal serr As String _
            ) As Long       ' x must be first of six array elements
    ' serr must be able to hold 256 bytes
    ' star must be able to hold 40 bytes

 
    Private Declare PtrSafe Function swe_fixstar_mag Lib "swedll64.dll" _
            ( _
              ByVal star As String, _
              ByRef mag As Double, _
              ByVal serr As String _
            ) As Long       ' serr must be able to hold 256 bytes
    ' star must be able to hold 40 bytes

    Private Declare PtrSafe Function swe_gauquelin_sector Lib "swedll64.dll" _
           ( _
          ByVal tjd_ut As Double, _
          ByVal ipl As Long, _
          ByVal starname As String, _
          ByVal iflag As Long, _
          ByVal imeth As Long, _
          ByRef geopos As Double, _
          ByVal atpress As Double, _
          ByVal attemp As Double, _
          ByRef dgsect As Double, _
          ByVal serr As String _
        ) As Long

    Private Declare PtrSafe Function swe_get_ayanamsa Lib "swedll64.dll" _
          ( _
              ByVal tjd_et As Double _
            ) As Double

 
    Private Declare PtrSafe Function swe_get_ayanamsa_ut Lib "swedll64.dll" _
         ( _
              ByVal tjd_ut As Double _
            ) As Double

 
    Private Declare PtrSafe Sub swe_get_planet_name Lib "swedll64.dll" _
          ( _
              ByVal ipl As Long, _
              ByVal pname As String _
            )

 
    Private Declare PtrSafe Function swe_get_tid_acc Lib "swedll64.dll" _
          ( _
            ) As Double


    Private Declare PtrSafe Sub swe_house_name Lib "swedll64.dll" _
           ( _
              ByVal ihsy As Long _
            )
    ' svers must be able to hold 256 bytes

    Private Declare PtrSafe Function swe_houses Lib "swedll64.dll" _
          ( _
              ByVal tjd_ut As Double, _
              ByVal geolat As Double, _
              ByVal geolon As Double, _
              ByVal ihsy As Long, _
              ByRef hcusps As Double, _
              ByRef ascmc As Double _
            ) As Long       ' hcusps must be first of 13 array elements
    ' ascmc must be first of 10 array elements

   
    Private Declare PtrSafe Function swe_houses_ex Lib "swedll64.dll" _
    ( _
              ByVal tjd_ut As Double, _
              ByVal iflag As Long, _
              ByVal geolat As Double, _
              ByVal geolon As Double, _
              ByVal ihsy As Long, _
              ByRef hcusps As Double, _
              ByRef ascmc As Double _
            ) As Long       ' hcusps must be first of 13 array elements
    ' ascmc must be first of 10 array elements

  
    Private Declare PtrSafe Function swe_houses_armc Lib "swedll64.dll" _
           ( _
              ByVal armc As Double, _
              ByVal geolat As Double, _
              ByVal eps As Double, _
              ByVal ihsy As Long, _
              ByRef hcusps As Double, _
              ByRef ascmc As Double _
            ) As Long       ' hcusps must be first of 13 array elements
    ' ascmc must be first of 10 array elements

  
    Private Declare PtrSafe Function swe_house_pos Lib "swedll64.dll" _
       ( _
              ByVal armc As Double, _
              ByVal geolat As Double, _
              ByVal eps As Double, _
              ByVal ihsy As Long, _
              ByRef xpin As Double, _
              ByVal serr As String _
            ) As Double
    ' xpin must be first of 2 array elements
    ' serr must be able to hold 256 bytes

  
  
    Private Declare PtrSafe Function swe_julday Lib "swedll64.dll" _
       ( _
        ByVal Year As Long, _
        ByVal Month As Long, _
        ByVal Day As Long, _
        ByVal hour As Double, _
        ByVal gregflg As Long _
      ) As Double

    Private Declare PtrSafe Function swe_lun_eclipse_how Lib "swedll64.dll" _
             ( _
              ByVal tjd_ut As Double, _
              ByVal ifl As Long, _
              ByRef geopos As Double, _
              ByRef attr As Double, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

  
    Private Declare PtrSafe Function swe_lun_eclipse_when_loc Lib "swedll64.dll" _
           ( _
              ByVal tjd_start As Double, _
              ByVal ifl As Long, _
              ByRef geopos As Double, _
              ByRef tret As Double, _
              ByRef attr As Double, _
              ByVal backward As Long, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

    Private Declare PtrSafe Function swe_lun_eclipse_when Lib "swedll64.dll" _
            ( _
              ByVal tjd_start As Double, _
              ByVal ifl As Long, _
              ByVal ifltype As Long, _
              ByRef tret As Double, _
              ByVal backward As Long, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

  
    Private Declare PtrSafe Function swe_nod_aps Lib "swedll64.dll" _
            ( _
              ByVal tjd_et As Double, _
              ByVal ipl As Long, _
              ByVal iflag As Long, _
              ByVal method As Long, _
              ByRef xnasc As Double, _
              ByRef xndsc As Double, _
              ByRef xperi As Double, _
              ByRef xaphe As Double, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

    Private Declare PtrSafe Function swe_nod_aps_ut Lib "swedll64.dll" _
            ( _
              ByVal tjd_ut As Double, _
              ByVal ipl As Long, _
              ByVal iflag As Long, _
              ByVal method As Long, _
              ByRef xnasc As Double, _
              ByRef xndsc As Double, _
              ByRef xperi As Double, _
              ByRef xaphe As Double, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

    Private Declare PtrSafe Function swe_pheno Lib "swedll64.dll" _
            ( _
              ByVal tjd As Double, _
              ByVal ipl As Long, _
              ByVal iflag As Long, _
              ByRef attr As Double, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

    Private Declare PtrSafe Function swe_pheno_ut Lib "swedll64.dll" _
             ( _
              ByVal tjd As Double, _
              ByVal ipl As Long, _
              ByVal iflag As Long, _
              ByRef attr As Double, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

    Private Declare PtrSafe Function swe_refrac Lib "swedll64.dll" _
           ( _
              ByVal inalt As Double, _
              ByVal atpress As Double, _
              ByVal attemp As Double, _
              ByVal calc_flag As Long _
            ) As Double

    Private Declare PtrSafe Function swe_refrac_extended Lib "swedll64.dll" _
             ( _
              ByVal inalt As Double, _
              ByVal geoalt As Double, _
              ByVal atpress As Double, _
              ByVal attemp As Double, _
              ByVal lapse_rate As Double, _
              ByVal calc_flag As Long, _
              ByRef dret As Double) _
          As Double

    Private Declare PtrSafe Sub swe_revjul Lib "swedll64.dll" _
            ( _
              ByVal tjd As Double, _
              ByVal gregflg As Long, _
              ByRef Year As Long, _
              ByRef Month As Long, _
              ByRef Day As Long, _
              ByRef hour As Double _
            )

  
    Private Declare PtrSafe Function swe_rise_trans_true_hor Lib "swedll64.dll" _
           ( _
              ByVal tjd_ut As Double, _
              ByVal ipl As Long, _
              ByVal starname As String, _
              ByVal epheflag As Long, _
              ByVal rsmi As Long, _
              ByRef geopos As Double, _
              ByVal atpress As Double, _
              ByVal attemp As Double, _
              ByVal horhgt As Double, _
              ByRef tret As Double, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

    Private Declare PtrSafe Function swe_rise_trans Lib "swedll64.dll" _
          ( _
              ByVal tjd_ut As Double, _
              ByVal ipl As Long, _
              ByVal starname As String, _
              ByVal epheflag As Long, _
              ByVal rsmi As Long, _
              ByRef geopos As Double, _
              ByVal atpress As Double, _
              ByVal attemp As Double, _
              ByRef tret As Double, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

    Private Declare PtrSafe Sub swe_set_ephe_path Lib "swedll64.dll" _
            ( _
              ByVal path As String _
            )

   
    Private Declare PtrSafe Sub swe_set_jpl_file Lib "swedll64.dll" _
          ( _
              ByVal file As String _
            )

  
    Private Declare PtrSafe Function swe_set_sid_mode Lib "swedll64.dll" _
         ( _
              ByVal sid_mode As Long, _
              ByVal t0 As Double, _
              ByVal ayan_t0 As Double _
            ) As Long

  
    Private Declare PtrSafe Sub swe_set_topo Lib "swedll64.dll" _
          ( _
              ByVal geolon As Double, _
              ByVal geolat As Double, _
              ByVal altitude As Double _
            )

  
    Private Declare PtrSafe Sub swe_set_lapse_rate Lib "swedll64.dll" _
      ( _
              ByVal x As Double _
            )

    Private Declare PtrSafe Sub swe_set_tid_acc Lib "swedll64.dll" _
        ( _
              ByVal x As Double _
            )

  
    Private Declare PtrSafe Function swe_sidtime0 Lib "swedll64.dll" _
         ( _
              ByVal tjd_ut As Double, _
              ByVal ecl As Double, _
              ByVal nut As Double _
            ) As Double

  
    Private Declare PtrSafe Function swe_sidtime Lib "swedll64.dll" _
     ( _
              ByVal tjd_ut As Double _
            ) As Double

    Private Declare PtrSafe Function swe_sol_eclipse_how Lib "swedll64.dll" _
           ( _
              ByVal tjd_ut As Double, _
              ByVal ifl As Long, _
              ByRef geopos As Double, _
              ByRef attr As Double, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

  
    Private Declare PtrSafe Function swe_sol_eclipse_when_glob Lib "swedll64.dll" _
        ( _
              ByVal tjd_start As Double, _
              ByVal ifl As Long, _
              ByVal ifltype As Long, _
              ByRef tret As Double, _
              ByVal backward As Long, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

    Private Declare PtrSafe Function swe_lun_occult_when_glob Lib "swedll64.dll" _
       ( _
              ByVal tjd_start As Double, _
              ByVal ipl As Long, _
              ByVal star As String, _
              ByVal ifl As Long, _
              ByVal ifltype As Long, _
              ByRef tret As Double, _
              ByVal backward As Long, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

    Private Declare PtrSafe Function swe_sol_eclipse_when_loc Lib "swedll64.dll" _
    ( _
              ByVal tjd_start As Double, _
              ByVal ifl As Long, _
              ByRef geopos As Double, _
              ByRef tret As Double, _
              ByRef attr As Double, _
              ByVal backward As Long, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

    Private Declare PtrSafe Function swe_lun_occult_when_loc Lib "swedll64.dll" _
    ( _
              ByVal tjd_start As Double, _
              ByVal ipl As Long, _
              ByVal star As String, _
              ByVal ifl As Long, _
              ByRef tret As Double, _
              ByRef attr As Double, _
              ByVal backward As Long, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

  
    Private Declare PtrSafe Function swe_sol_eclipse_where Lib "swedll64.dll" _
       ( _
              ByVal tjd_ut As Double, _
              ByVal ifl As Long, _
              ByRef geopos As Double, _
              ByRef attr As Double, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

    Private Declare PtrSafe Function swe_lun_occult_where Lib "swedll64.dll" _
    ( _
              ByVal tjd_ut As Double, _
              ByVal ipl As Long, _
              ByVal star As String, _
              ByVal ifl As Long, _
              ByRef geopos As Double, _
              ByRef attr As Double, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

  
    Private Declare PtrSafe Function swe_time_equ Lib "swedll64.dll" _
        ( _
              ByVal tjd_ut As Double, _
              ByRef e As Double, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

    Private Declare PtrSafe Function swe_lmt_to_lat Lib "swedll64.dll" _
  ( _
              ByVal tjd_lmt As Double, _
              ByVal geolon As Double, _
              ByRef tjd_lat As Double, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

    Private Declare PtrSafe Function swe_lat_to_lmt Lib "swedll64.dll" _
       ( _
              ByVal tjd_lat As Double, _
              ByVal geolon As Double, _
              ByRef tjd_lmt As Double, _
              ByVal serr As String _
            ) As Long
    ' serr must be able to hold 256 bytes

    Private Declare PtrSafe Sub swe_version Lib "swedll64.dll" _
 ( _
              ByVal svers As String _
            )
    ' svers must be able to hold 256 bytes

    Private Declare PtrSafe Function swe_heliacal_ut Lib "swedll64.dll" _
 ( _
           ByVal tjd_start As Double, _
           ByRef dgeo As Double, _
           ByRef datm As Double, _
           ByRef dobs As Double, _
           ByVal ObjectName As String, _
           ByVal TypeEvent As Long, _
           ByVal helflag As Long, _
           ByRef dret As Double, _
           ByVal serr As String _
         ) As Long   ' dret must be first of 50 array elements
    ' serr must be able to hold 256 bytes

    Private Declare PtrSafe Function swe_vis_limit_mag Lib "swedll64.dll" _
   ( _
         ByVal tjd_ut As Double, _
         ByRef dgeo As Double, _
         ByRef datm As Double, _
         ByRef dobs As Double, _
         ByVal ObjectName As String, _
         ByVal helflag As Long, _
         ByRef dret As Double, _
         ByVal serr As String _
       ) As Long   ' dret must be first of 50 array elements
    ' serr must be able to hold 256 bytes

    Private Declare PtrSafe Function swe_utc_to_jd Lib "swedll64.dll" _
      ( _
         ByVal iyear As Long, _
         ByVal imonth As Long, _
         ByVal iday As Long, _
         ByVal ihour As Long, _
         ByVal imin As Long, _
         ByVal dsec As Double, _
         ByVal gregflag As Long, _
         ByRef dret As Double, _
         ByVal serr As String _
       ) As Long   ' dret must be first of 10 array elements
    ' serr must be able to hold 256 bytes

    Private Declare PtrSafe Function swe_jdet_to_utc Lib "swedll64.dll" _
   ( _
         ByVal tjd_et As Double, _
         ByVal gregflag As Long, _
         ByRef iyear As Long, _
         ByRef imonth As Long, _
         ByRef iday As Long, _
         ByRef ihour As Long, _
         ByRef imin As Long, _
         ByRef dsec As Double _
       ) As Long

    Private Declare PtrSafe Function swe_jdut1_to_utc Lib "swedll64.dll" _
   ( _
         ByVal tjd_ut As Double, _
         ByVal gregflag As Long, _
         ByRef iyear As Long, _
         ByRef imonth As Long, _
         ByRef iday As Long, _
         ByRef ihour As Long, _
         ByRef imin As Long, _
         ByRef dsec As Double _
       ) As Long

    Private Declare PtrSafe Function swe_utc_time_zone Lib "swedll64.dll" _
      ( _
         ByVal iyear As Long, _
         ByVal imonth As Long, _
         ByVal iday As Long, _
         ByVal ihour As Long, _
         ByVal imin As Long, _
         ByVal dsec As Double, _
         ByVal dtimezone As Double, _
         ByRef iyear_out As Long, _
         ByRef imonth_out As Long, _
         ByRef iday_out As Long, _
         ByRef ihour_out As Long, _
         ByRef imin_out As Long, _
         ByRef dsec_out As Double _
       ) As Long

    ' values for gregflag in swe_julday() and swe_revjul()
    Const SE_JUL_CAL As Integer = 0
    Const SE_GREG_CAL As Integer = 1

    ' planet and body numbers (parameter ipl) for swe_calc()
    Const SE_ECL_NUT As Integer = -1

    Const SE_SUN As Integer = 0
    Const SE_MOON As Integer = 1
    Const SE_MERCURY As Integer = 2
    Const SE_VENUS As Integer = 3
    Const SE_MARS As Integer = 4
    Const SE_JUPITER As Integer = 5
    Const SE_SATURN As Integer = 6
    Const SE_URANUS As Integer = 7
    Const SE_NEPTUNE As Integer = 8
    Const SE_PLUTO As Integer = 9
    Const SE_MEAN_NODE As Integer = 10
    Const SE_TRUE_NODE As Integer = 11
    Const SE_MEAN_APOG As Integer = 12
    Const SE_OSCU_APOG As Integer = 13
    Const SE_EARTH As Integer = 14
    Const SE_CHIRON As Integer = 15
    Const SE_PHOLUS As Integer = 16
    Const SE_CERES As Integer = 17
    Const SE_PALLAS As Integer = 18
    Const SE_JUNO As Integer = 19
    Const SE_VESTA As Integer = 20

    Const SE_NPLANETS As Integer = 21
    Const SE_AST_OFFSET As Integer = 10000
    Const SE_VARUNA As Integer = (SE_AST_OFFSET + 20000)

    ' Hamburger or Uranian ficticious "planets"
    Const SE_FICT_OFFSET As Integer = 40
    Const SE_FICT_MAX As Integer = 999  'maximum number for ficticious planets
    'if taken from file seorbel.txt
    Const SE_NFICT_ELEM As Integer = 19  'number of built-in ficticious planets
    Const SE_CUPIDO As Integer = 40
    Const SE_HADES As Integer = 41
    Const SE_ZEUS As Integer = 42
    Const SE_KRONOS As Integer = 43
    Const SE_APOLLON As Integer = 44
    Const SE_ADMETOS As Integer = 45
    Const SE_VULKANUS As Integer = 46
    Const SE_POSEIDON As Integer = 47
    ' other ficticious bodies
    Const SE_ISIS As Integer = 48
    Const SE_NIBIRU As Integer = 49
    Const SE_HARRINGTON As Integer = 50
    Const SE_NEPTUNE_LEVERRIER As Integer = 51
    Const SE_NEPTUNE_ADAMS As Integer = 52
    Const SE_PLUTO_LOWELL As Integer = 53
    Const SE_PLUTO_PICKERING As Integer = 54
    Const SE_VULCAN As Integer = 55
    Const SE_WHITE_MOON As Integer = 56
    Const SE_PROSERPINA As Integer = 57
    Const SE_WALDEMATH As Integer = 58

    ' points returned by swe_houses() and swe_houses_armc()
    ' in array ascmc(0...10)
    Const SE_ASC As Integer = 0
    Const SE_MC As Integer = 1
    Const SE_ARMC As Integer = 2
    Const SE_VERTEX As Integer = 3
    Const SE_EQUASC As Integer = 4   ' "equatorial ascendant"
    Const SE_COASC1 As Integer = 5   ' "co-ascendant (W. Koch)"
    Const SE_COASC2 As Integer = 6   ' "co-ascendant (M. Munkasey)"
    Const SE_POLASC As Integer = 7   ' "polar ascendant (M. Munkasey)"
    Const SE_NASCMC As Integer = 8   ' number of such points

    ' iflag values for swe_calc()/swe_calc_ut() and swe_fixstar()/swe_fixstar_ut()
    Const SEFLG_JPLEPH As Long = 1
    Const SEFLG_SWIEPH As Long = 2
    Const SEFLG_MOSEPH As Long = 4
    Const SEFLG_SPEED As Long = 256
    Const SEFLG_HELCTR As Long = 8
    Const SEFLG_TRUEPOS As Long = 16
    Const SEFLG_J2000 As Long = 32
    Const SEFLG_NONUT As Long = 64
    Const SEFLG_NOGDEFL As Long = 512
    Const SEFLG_NOABERR As Long = 1024
    Const SEFLG_EQUATORIAL As Long = 2048
    Const SEFLG_XYZ As Long = 4096
    Const SEFLG_RADIANS As Long = 8192
    Const SEFLG_BARYCTR As Long = 16384
    Const SEFLG_TOPOCTR As Long = 32768
    Const SEFLG_SIDEREAL As Long = 65536
    Const SEFLG_ICRS As Long = 131072
    Const SEFLG_DPSIDEPS_1980 As Long = 262144
    Const SEFLG_JPLHOR As Long = 524288
    Const SEFLG_JPLHOR_APPROX As Long = 1048576

    Const SE_SIDBIT_ECL_T0 As Long = 256  ' for positions referred to equinox t0
    Const SE_SIDBIT_SSY_PLANE As Long = 256  ' for positions referred to solar system plane

    ' used with swe_nod_aps()
    Const SE_NOTBIT_MEAN As Long = 1  ' mean nodes/apsides
    Const SE_NOTBIT_OSCU As Long = 2  ' osculating nodes/apsides
    Const SE_NOTBIT_OSCU_BAR As Long = 4  ' same, but motion about solar system barycenter considered
    Const SE_NOTBIT_FOPOINT As Long = 256  ' focal point of orbit instead of aphelion

    'eclipse codes
    Const SE_ECL_CENTRAL As Long = 1
    Const SE_ECL_NONCENTRAL As Long = 2
    Const SE_ECL_TOTAL As Long = 4
    Const SE_ECL_ANNULAR As Long = 8
    Const SE_ECL_PARTIAL As Long = 16
    Const SE_ECL_ANNULAR_TOTAL As Long = 32
    Const SE_ECL_PENUMBRAL As Long = 64
    Const SE_ECL_VISIBLE As Long = 128
    Const SE_ECL_MAX_VISIBLE As Long = 256
    Const SE_ECL_1ST_VISIBLE As Long = 512
    Const SE_ECL_PARTBEG_VISIBLE As Long = 512
    Const SE_ECL_2ND_VISIBLE As Long = 1024
    Const SE_ECL_TOTBEG_VISIBLE As Long = 1024
    Const SE_ECL_3RD_VISIBLE As Long = 2048
    Const SE_ECL_TOTEND_VISIBLE As Long = 2048
    Const SE_ECL_4TH_VISIBLE As Long = 4096
    Const SE_ECL_PARTEND_VISIBLE As Long = 4096
    Const SE_ECL_PENUMBBEG_VISIBLE As Long = 8192
    Const SE_ECL_PENUMBEND_VISIBLE As Long = 16384
    Const SE_ECL_ONE_TRY As Long = 32768

    'sidereal modes, for swe_set_sid_mode()
    Const SE_SIDM_FAGAN_BRADLEY As Long = 0
    Const SE_SIDM_LAHIRI As Long = 1
    Const SE_SIDM_DELUCE As Long = 2
    Const SE_SIDM_RAMAN As Long = 3
    Const SE_SIDM_USHASHASHI As Long = 4
    Const SE_SIDM_KRISHNAMURTI As Long = 5
    Const SE_SIDM_DJWHAL_KHUL As Long = 6
    Const SE_SIDM_YUKTESHWAR As Long = 7
    Const SE_SIDM_JN_BHASIN As Long = 8
    Const SE_SIDM_BABYL_KUGLER1 As Long = 9
    Const SE_SIDM_BABYL_KUGLER2 As Long = 10
    Const SE_SIDM_BABYL_KUGLER3 As Long = 11
    Const SE_SIDM_BABYL_HUBER As Long = 12
    Const SE_SIDM_BABYL_ETPSC As Long = 13
    Const SE_SIDM_ALDEBARAN_15TAU As Long = 14
    Const SE_SIDM_HIPPARCHOS As Long = 15
    Const SE_SIDM_SASSANIAN As Long = 16
    Const SE_SIDM_GALCENT_0SAG As Long = 17
    Const SE_SIDM_J2000 As Long = 18
    Const SE_SIDM_J1900 As Long = 19
    Const SE_SIDM_B1950 As Long = 20
    Const SE_SIDM_SURYASIDDHANTA As Long = 21
    Const SE_SIDM_SURYASIDDHANTA_MSUN As Long = 22
    Const SE_SIDM_ARYABHATA As Long = 23
    Const SE_SIDM_ARYABHATA_MSUN As Long = 24
    Const SE_SIDM_SS_REVATI As Long = 25
    Const SE_SIDM_SS_CITRA As Long = 26
    Const SE_SIDM_TRUE_CITRA As Long = 27
    Const SE_SIDM_TRUE_REVATI As Long = 28

    Const SE_SIDM_USER As Long = 255

    Const SE_NSIDM_PREDEF As Long = 29

    Const SE_SIDBITS As Long = 256


    ' modes for planetary nodes/apsides, swe_nod_aps(), swe_nod_aps_ut()
    Const SE_NODBIT_MEAN As Long = 1
    Const SE_NODBIT_OSCU As Long = 2
    Const SE_NODBIT_OSCU_BAR As Long = 3
    Const SE_NODBIT_FOPOINT As Long = 256

    ' indices for swe_rise_trans()
    Const SE_CALC_RISE As Long = 1
    Const SE_CALC_SET As Long = 2
    Const SE_CALC_MTRANSIT As Long = 4
    Const SE_CALC_ITRANSIT As Long = 8
    Const SE_BIT_DISC_CENTER As Long = 256  '/* to be added to SE_CALC_RISE/SET */
    '/* if rise or set of disc center is */
    '/* requried */
    Const SE_BIT_NO_REFRACTION As Long = 512  '/* to be added to SE_CALC_RISE/SET, */
    '/* if refraction is not to be considered */
    Const SE_BIT_CIVIL_TWILIGHT As Long = 1024  '/* to be added to SE_CALC_RISE/SET, */
    Const SE_BIT_NAUTIC_TWILIGHT As Long = 2048  '/* to be added to SE_CALC_RISE/SET, */
    Const SE_BIT_ASTRO_TWILIGHT As Long = 4096  '/* to be added to SE_CALC_RISE/SET, */
    Const SE_BIT_FIXED_DISC_SIZE As Long = 16384  '/* to be added to SE_CALC_RISE/SET, */



    ' bits for data conversion with swe_azalt() and swe_azalt_rev()
    Const SE_ECL2HOR As Long = 0
    Const SE_EQU2HOR As Long = 1
    Const SE_HOR2ECL As Long = 0
    Const SE_HOR2EQU As Long = 1

    ' for swe_refrac()
    Const SE_TRUE_TO_APP As Long = 0
    Const SE_APP_TO_TRUE As Long = 1

    ' for heliacal risings etc.
    Const SE_HELIACAL_RISING As Long = 1
    Const SE_HELIACAL_SETTING As Long = 2
    Const SE_MORNING_FIRST As Long = SE_HELIACAL_RISING
    Const SE_EVENING_LAST As Long = SE_HELIACAL_SETTING
    Const SE_EVENING_FIRST As Long = 3
    Const SE_MORNING_LAST As Long = 4
    Const SE_ACRONYCHAL_RISING As Long = 5   ' still not implemented
    Const SE_COSMICAL_SETTING As Long = 6   ' still not implemented
    Const SE_ACRONYCHAL_SETTING As Long = SE_COSMICAL_SETTING

    Const SE_HELFLAG_LONG_SEARCH As Long = 128
    Const SE_HELFLAG_HIGH_PRECISION As Long = 256
    Const SE_HELFLAG_OPTICAL_PARAMS As Long = 512
    Const SE_HELFLAG_NO_DETAILS As Long = 1024

    Const SE_PHOTOPIC_FLAG As Long = 0
    Const SE_SCOTOPIC_FLAG As Long = 1
    Const SE_MIXEDOPIC_FLAG As Long = 2


Public Function Ayan(b As Double, N As Integer) As Double
      TJ = b + 2415018.5
      i = swe_set_sid_mode(N, 0, 0)
      Ayan = swe_get_ayanamsa_ut(TJ)
End Function

Public Function bhav( _
   latitude As Double, _
   longitude As Double, _
   nh As Integer, _
   b As Double) _
As Double

Dim jul_day_UT As Double, x(13) As Double, A(10) As Double
Dim i As Long

   jul_day_UT = b + 2415018.5
      i = swe_set_sid_mode(1, 0, 0)
      i = swe_houses_ex(jul_day_UT, 65536, latitude, longitude, Asc("P"), x(0), A(0))
   bhav = x(nh)

End Function
 
 Public Function risesetplanet( _
   lat As Double, _
   lon As Double, _
   b As Double, _
   riseset As Long, _
   planet As Long) _
As Double

Dim jul_day_UT As Double, tret(10) As Double
Dim ret_flag As Double, geopos(3) As Double, serr As String
geopos(0) = lon
geopos(1) = lat
geopos(2) = 0
    jul_day_UT = b + 2415017.5
    ret_flag = swe_rise_trans(jul_day_UT, planet, "", 2, riseset, geopos(0), 1013.25, 10, tret(0), serr)
    h = tret(0) - 2415018.5
    risesetplanet = h
End Function
 
   Public Function Grah( _
   b As Double, _
N As Long) _
As Double

Dim x(6) As Double
Dim TJ As Double
Dim i As Long, serr As String

    TJ = b + 2415018.5
   i = swe_set_sid_mode(1, 0, 0)
   i = swe_calc_ut(TJ, N, 65536, x(0), serr)
Grah = x(0)

End Function

Public Function lagn( _
   latitude As Double, _
   longitude As Double, _
   b As Double) _
As Double

Dim jul_day_UT As Double, x(13) As Double, A(10) As Double
Dim i As Long

   jul_day_UT = b + 2415018.5
      i = swe_houses_ex(jul_day_UT, 65536, latitude, longitude, Asc("A"), x(0), A(0))
   lagn = A(0)

End Function

Public Function lagnt( _
   latitude As Double, _
   longitude As Double, _
   b As Double, y As Double) _
As Double

Dim jul_day_UT As Double, x(13) As Double, A(10) As Double
Dim i As Long

   bt = b + 2415018.5
      i = swe_houses_ex(bt, 65536, latitude, longitude, Asc("A"), x(0), A(0))
   s = A(0)
bf = bt + (y - s) / 360
If bf < bt - 1 Then bf = bf + 1
If bf > bt + 1 Then bf = bf - 1

For j = 1 To 5
i = swe_houses_ex(bf, 65536, latitude, longitude, Asc("A"), x(0), A(0))
   s = A(0)
bf = bf + (y - s) / 360
If bf < bt - 1 Then bf = bf + 1
If bf > bt + 1 Then bf = bf - 1
Next j
lagnt = bf - 2415018.5
End Function

Public Function Gati( _
   b As Double, _
N As Long) _
As Double

Dim x(6) As Double
Dim TJ As Double
Dim i As Long, serr As String

    TJ = b + 2415018.5
   i = swe_set_sid_mode(1, 0, 0)
   i = swe_calc_ut(TJ, N, 65536 + 256, x(0), serr)
Gati = x(3)

End Function


Public Function sol(ByVal b As Double, ByVal y As Double) As Double
Dim x(6) As Double
Dim j As Long, serr As String
b = b + 2415018.5
j = swe_calc_ut(b, 0, 65536, x(0), serr)
s = x(0)
sf = (y * 360 / 365.25636 + s)
20 If sf > 360 Then sf = sf - 360: GoTo 20
30 If sf < 0 Then sf = sf + 360: GoTo 30
sr = 0
For i = 1 To 4
j = swe_calc_ut(b + y, 0, 65536, x(0), serr)
s1 = x(0)
sr = sf - s1
y = y + sr
Next i
sol = y + b - 2415018.5
End Function

Private Function set_strlen(c$) As String

     End Function
         i = InStr(c$, Chr(0))
         If (i > 0) Then c$ = Left(c$, i - 1)
         set_strlen = c$
     End Function

