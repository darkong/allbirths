
/*Designate sources files, datalengths of source files, and output destinations*/
%let bcfiles = O:\CA_BIRTH_COMPLETE_MASTERFILE_1997_2011;

%let in1997 = \1997\BSMF97_nosssn.dat;
%let in1998 = \1998\B98SEALnoSSN.dat;
%let in1999 = \1999\B99SSNad.dat;
%let in2000 = \2000\B00SSNAD.dat;
%let in2001 = \2001\B01SSNAD.dat;
%let in2002 = \2002\B02SSNAD.dat;
%let in2003 = \2003\B03SSNAD.dat;
%let in2004 = \2004\B04SSNAD.dat;
%let in2005 = \2005\B05SSNAD.dat;
%let in2006 = \2006\B06SSNAD.dat;
%let in2007 = \2007\B07SSNAD.dat;
%let in2008 = \2008\B08SSNAD.dat;
%let in2009 = \2009\B09SEAL.dat;
%let in2010 = \2010\B10ADDR.dat;
%let in2011 = \2011\Births11_statewide.dat;
%let in2012 = \2012\Births12_statewide.dat;

%let out1997 = \1997\harmbirths1997;
%let out1998 = \1998\harmbirths1998;
%let out1999 = \1999\harmbirths1999;
%let out2000 = \2000\harmbirths2000;
%let out2001 = \2001\harmbirths2001;
%let out2002 = \2002\harmbirths2002;
%let out2003 = \2003\harmbirths2003;
%let out2004 = \2004\harmbirths2004;
%let out2005 = \2005\harmbirths2005;
%let out2006 = \2006\harmbirths2006;
%let out2007 = \2007\harmbirths2007;
%let out2008 = \2008\harmbirths2008;
%let out2009 = \2009\harmbirths2009;
%let out2010 = \2010\harmbirths2010;
%let out2011 = \2011\harmbirths2011;
%let out2012 = \2012\harmbirths2012;

%macro datalength;
%if &i = 1997 %then %do;
      500
%end;
%if &i = 1998 %then %do;
      980
%end;
%if &i > 1998 and &i < 2009 %then %do;
      500
%end;
%if &i = 2009 %then %do;
      1300
%end;
%if &i > 2009 %then %do;
      500
%end;
%mend;

/*Create a template file with the final set of variables in the right format*/
data template;
length izid $15
	   birthid 8
	   county 8
	   lrd $3
	   lhjbirth 8
	   cabirth 8
	   forcounty $3
	   btype 8
	   hospcode 8
	   lnameinf $34
	   fnameinf $30
	   mnameinf $24
	   sex 8
	   dobinf 8
	   dodinf 8
	   bweight 8
	   gestation 8
	   lnamemom $30
	   fnamemom $20
	   dobmom 8
	   agemom 8
	   ssn $9
	   addmom $50
	   citymom $35
	   zipmom $5
	   resmom 8
	   caresmom 8
	   foresmom $3
	   sibs 8
       ctract $6
       racemom1 8
	   mracemom 8
       racedad1 8
	   mracedad 8
       agedad 8
       prenatnum 8
       lnamedad $33
       paybirth 8;
run;

/*Determine the correct data columns per variable for each year*/

%macro birthid;
%if &i = 1997  %then %do;
      birthid		1-6
%end;
%if &i = 1998 %then %do;
      birthid		21-26
%end;
%if &i > 1998 and &i < 2009 %then %do;
      birthid		1-6
%end;
%if &i = 2009 %then %do;
      birthid		21-26
%end;
%if &i > 2009 %then %do;
      birthid		1-6
%end;
%mend;


%macro btype;
%if &i = 1997 %then %do;
      Btype		61
%end;
%if &i = 1998 %then %do;
      Btype		164
%end;
%if &i > 1998 and &i < 2009 %then %do;
      Btype		61
%end;
%if &i = 2009 %then %do;
      Btype		176
%end;
%if &i > 2009 %then %do;
      Btype		61
%end;
%mend;

%macro fnameinf;
%if &i = 1997 %then %do;
      FnameInf	$33-44
%end;
%if &i = 1998 %then %do;
      FnameInf	$27-51
%end;
%if &i > 1998 and &i < 2009 %then %do;
      FnameInf	$33-44
%end;
%if &i = 2009 %then %do;
      FnameInf	$27-56
%end;
%if &i > 2009 %then %do;
      FnameInf	$33-44
%end;
%mend;

%macro lnameinf;
%if &i = 1997 %then %do;
      LnameInf	$13-32
%end;
%if &i = 1998 %then %do;
      LnameInf	$70-102
%end;
%if &i > 1998 and &i < 2009 %then %do;
      LnameInf	$13-32
%end;
%if &i = 2009 %then %do;
      LnameInf	$81-114
%end;
%if &i > 2009 %then %do;
      LnameInf	$13-32
%end;
%mend;

%macro mnameinf;
%if &i = 1997 %then %do;
      MnameInf	$45-56
%end;
%if &i = 1998 %then %do;
      MnameInf	$52-69
%end;
%if &i > 1998 and &i < 2009 %then %do;
      MnameInf	$45-56
%end;
%if &i = 2009 %then %do;
      MnameInf	$57-80
%end;
%if &i > 2009 %then %do;
      MnameInf	$45-56
%end;
%mend;

%macro sex;
%if &i = 1997 %then %do;
      sex	58
%end;
%if &i = 1998 %then %do;
      sex	163
%end;
%if &i > 1998 and &i < 2009 %then %do;
      sex	58
%end;
%if &i = 2009 %then %do;
      sex	175
%end;
%if &i > 2009 %then %do;
      sex	58
%end;
%mend;

%macro bweight;
%if &i = 1997 %then %do;
      bweight       63-66
%end;
%if &i = 1998 %then %do;
      bweight       159-162
%end;
%if &i > 1998 and &i < 2009 %then %do;
      bweight		63-66
%end;
%if &i = 2009 %then %do;
      bweight		171-174
%end;
%if &i > 2009 %then %do;
      bweight		63-66
%end;
%mend;

%macro gestation;
%if &i = 1997 %then %do;
      gestation		143-145
%end;
%if &i = 1998 %then %do;
      gestation		815-817
%end;
%if &i > 1998 and &i < 2009 %then %do;
      gestation		143-145
%end;
%if &i = 2009 %then %do;
      gestation		1117-1119
%end;
%if &i > 2009 %then %do;
      gestation		143-145
%end;
%mend;

%macro yobinf;
%if &i = 1997 %then %do;
      yobinf		$68-69
%end;
%if &i = 1998 %then %do;
      yobinf		$149-150
%end;
%if &i > 1998 and &i < 2009 %then %do;
      yobinf		$68-69
%end;
%if &i = 2009 %then %do;
      yobinf		$161-162
%end;
%if &i = 2010 %then %do;
      yobinf		$68-69
%end;
%if &i > 2010 %then %do;
      yobinf		$69-70
%end;
%mend;

%macro mobinf;
%if &i = 1997 %then %do;
      mobinf		$70-71
%end;
%if &i = 1998 %then %do;
      mobinf		$151-152
%end;
%if &i > 1998 and &i < 2009 %then %do;
      mobinf		$70-71
%end;
%if &i = 2009 %then %do;
      mobinf		$163-164
%end;
%if &i = 2010 %then %do;
      mobinf		$70-71
%end;
%if &i > 2010 %then %do;
      mobinf		$71-72
%end;
%mend;

%macro dabinf;
%if &i = 1997 %then %do;
      dabinf		$72-73
%end;
%if &i = 1998 %then %do;
      dabinf		$153-154
%end;
%if &i > 1998 and &i < 2009 %then %do;
      dabinf		$72-73
%end;
%if &i = 2009 %then %do;
      dabinf		$165-166
%end;
%if &i = 2010 %then %do;
      dabinf		$72-73
%end;
%if &i > 2010 %then %do;
      dabinf		$73-74
%end;
%mend;

%macro hospcode;
%if &i = 1997 %then %do;
      hospcode		74-77
%end;
%if &i = 1998 %then %do;
      hospcode		842-845
%end;
%if &i > 1998 and &i < 2009 %then %do;
      hospcode		74-77
%end;
%if &i = 2009 %then %do;
      hospcode		181-184
%end;
%if &i = 2010 %then %do;
      hospcode		74-77
%end;
%if &i > 2010 %then %do;
      hospcode		75-78
%end;
%mend;

%macro county;
%if &i = 1997 %then %do;
      county97		$79-80
%end;
%if &i = 1998 %then %do;  
      county98		$166-168
%end;
%if &i > 1998 and &i < 2009 %then %do;
      county97		$79-80
%end;
%if &i = 2009 %then %do;
      county98		$178-180
%end;
%if &i = 2010 %then %do;
      county97		$79-80
%end;
%if &i > 2010 %then %do;
      county11		$79-81
%end;
%mend;

%macro lnamemom;
%if &i = 1997 %then %do;
      LnameMom		$83-97
%end;
%if &i = 1998 %then %do; 
      LnameMom		$472-502
%end;
%if &i > 1998 and &i < 2009 %then %do;
      LnameMom		$83-97
%end;
%if &i = 2009 %then %do;
      LnameMom		$562-587
%end;
%if &i > 2009 %then %do;
      LnameMom		$82-96
%end;
%mend;

%macro fnamemom;
%if &i = 1997 %then %do;
      FnameMom		$277-284
%end;
%if &i = 1998 %then %do;
      FnameMom		$472-504
%end;
%if &i > 1998 and &i < 2009 %then %do;
      FnameMom		$277-284
%end;
%if &i = 2009 %then %do;
      FnameMom		$527-546
%end;
%if &i > 2009 %then %do;
      FnameMom		$277-284
%end;
%mend;

%macro agemom;
%if &i = 1997 %then %do;
      agemom		100-101
%end;
%if &i = 1998 %then %do;
      agemom		557-558
%end;
%if &i > 1998 and &i < 2009 %then %do;
      agemom		100-101
%end;
%if &i = 2009 %then %do;
      agemom		640-641
%end;
%if &i > 2009 %then %do;
      agemom		100-101
%end;
%mend;

%macro resmom;
%if &i = 1997 %then %do;
      resmom97		$107-108
%end;
%if &i = 1998 %then %do;
      resmom98		$743-745
%end;
%if &i > 1998 and &i < 2007 %then %do;
      resmom97		$107-108
%end;
%if &i > 2006 and &i < 2009 %then %do;
      resmom97		$103-104
%end;
%if &i = 2009 %then %do;
      resmom09		$924-926
%end;
%if &i = 2010 %then %do;
      resmom97		$103-104
%end;
%if &i > 2010 %then %do;
      resmom09		$103-105
%end;
%mend;

%macro dth_y;
%if &i = 1997 %then %do;
      dth_y		$127-128
%end;
%if &i = 1998 %then %do;
      dth_y		$181-182
%end;
%if &i > 1998 and &i < 2009 %then %do;
      dth_y		$127-128
%end;
%if &i = 2009 %then %do;
      dth_y		$196-197
%end;
%if &i > 2009 %then %do;
      dth_y		$127-128
%end;
%mend;

%macro dth_m;
%if &i = 1997 %then %do;
      dth_m		$129-130
%end;
%if &i = 1998 %then %do;
      dth_m		$183-184
%end;
%if &i > 1998 and &i < 2009 %then %do;
      dth_m		$129-130
%end;
%if &i = 2009 %then %do;
      dth_m		$198-199
%end;
%if &i > 2009 %then %do;
      dth_m		$129-130
%end;
%mend;

%macro dth_d;
%if &i = 1997 %then %do;
      dth_d		$131-132
%end;
%if &i = 1998 %then %do;
      dth_d		$185-186
%end;
%if &i > 1998 and &i < 2009 %then %do;
      dth_d		$131-132
%end;
%if &i = 2009 %then %do;
      dth_d		$200-201
%end;
%if &i > 2009 %then %do;
      dth_d		$131-132
%end;
%mend;

%macro zipmom;
%if &i = 1997 %then %do;
      zipmom		$287-291
%end;
%if &i = 1998 %then %do;
      zipmom		$754-758
%end;
%if &i > 1998 and &i < 2009 %then %do;
      zipmom		$287-291
%end;
%if &i = 2009 %then %do;
      zipmom		$929-933
%end;
%if &i > 2009 %then %do;
      zipmom		$287-291
%end;
%mend;

%macro lrd;
%if &i = 1997 %then %do;
      lrd		$308-309
%end;
%if &i = 1998 %then %do;
      lrd		$6-7
%end;
%if &i > 1998 and &i < 2009 %then %do;
      lrd		$308-309
%end;
%if &i = 2009 %then %do;
      lrd		$6-7
%end;
%if &i = 2010 %then %do;
      lrd		$308-309
%end;
%if &i > 2010 %then %do;
      lrd		$310-311
%end;
%mend;

%macro yobmom;
%if &i = 1997 %then %do;
      yobmom		$349-350
%end;
%if &i = 1998 %then %do;
      yobmom		$551-552
%end;
%if &i > 1998 and &i < 2009 %then %do;
      yobmom		$349-350
%end;
%if &i = 2009 %then %do;
      yobmom		$634-635
%end;
%if &i > 2009 %then %do;
      yobmom		$349-350
%end;
%mend;

%macro mobmom;
%if &i = 1997 %then %do;
      mobmom		$351-352
%end;
%if &i = 1998 %then %do;
      mobmom		$553-554
%end;
%if &i > 1998 and &i < 2009 %then %do;
      mobmom		$351-352
%end;
%if &i = 2009 %then %do;
      mobmom		$636-637
%end;
%if &i > 2009 %then %do;
      mobmom		$351-352
%end;
%mend;

%macro dabmom;
%if &i = 1997 %then %do;
      dabmom		$353-354
%end;
%if &i = 1998 %then %do;
      dabmom		$555-556
%end;
%if &i > 1998 and &i < 2009 %then %do;
      dabmom		$353-354
%end;
%if &i = 2009 %then %do;
      dabmom		$638-639
%end;
%if &i >  2009 %then %do;
      dabmom		$353-354
%end;
%mend;

%macro addmom;
%if &i = 1997 %then %do;
      addmom		$391-440
%end;
%if &i = 1998 %then %do;
      addmom		$658-707
%end;
%if &i > 1998 and &i < 2008 %then %do;
      addmom		$391-440
%end;
%if &i = 2008 %then %do;
      addmom		$397-446
%end;
%if &i = 2009 %then %do;
      addmom		$839-888
%end;
%if &i = 2010 %then %do;
      addmom		$397-446
%end;
%if &i > 2011 %then %do;
      addmom		$397-446
%end;
%mend;

%macro citymom;
%if &i = 1997 %then %do;
      citymom		$441-475
%end;
%if &i = 1998 %then %do;
      citymom		$708-742
%end;
%if &i > 1998 and &i < 2008 %then %do;
      citymom		$441-475
%end;
%if &i = 2008 %then %do;
      citymom		$447-481
%end;
%if &i = 2009 %then %do;
      citymom		$889-923
%end;
%if &i > 2009 %then %do;
      citymom		$447-481
%end;
%mend;

%macro ssn;
%if &i = 1997 or (&i > 1998 and &i < 2007) %then %do;
      SSN			$382-390
%end;
%if &i = 2007 %then %do;
      SSN			$485-493
%end;
%if &i = 2008 %then %do;
      SSN			$491-499
%end;
%mend;

%macro sibs;
%if &i = 1997 %then %do;
      sibs		153-154
%end;
%if &i = 1998 %then %do;
      sibs		779-780
%end;
%if &i > 1998 and &i < 2009 %then %do;
      sibs		153-154
%end;
%if &i = 2009 %then %do;
      sibs		1077-1078
%end;
%if &i > 2009 %then %do;
      sibs		153-154
%end;
%mend;

%macro ctract;
%if &i = 1997 %then %do;
      ctract		$113-118
%end;
%if &i = 1998 %then %do;
      ctract		$862-867
%end;
%if &i > 1998 and &i < 2009 %then %do;
      ctract		$113-118
%end;
%if &i = 2009 %then %do;
      ctract		$1026-1031
%end;
%if &i > 2009 %then %do;
      ctract		$113-118
%end;
%mend;

%macro racemom1;
%if &i = 1997 %then %do;
      racemom1		104-105
%end;
%if &i = 1998 %then %do;
      racemom1		560-561
%end;
%if &i = 1999 %then %do;
      racemom1		104-105
%end;
%if &i > 1999 and &i < 2009 %then %do;
      racemom1		355-356
%end;
%if &i = 2009 %then %do;
      racemom1		642-643
%end;
%if &i > 2009 %then %do;
      racemom1		355-356
%end;
%mend;

%macro mracemom;
%if &i > 1999 and &i < 2009 %then %do;
      mracemom	372
%end;
%if &i = 2009 %then %do;
      mracemom	813
%end;
%if &i > 2009 %then %do;
      mracemom	372
%end;
%mend;

%macro racedad1;
%if &i = 1997 %then %do;
      racedad1		123-124
%end;
%if &i = 1998 %then %do;
      racedad1		331-332
%end;
%if &i = 1999 %then %do;
      racedad1		123-124
%end;
%if &i > 1999 and &i < 2009 %then %do;
      racedad1		340-341
%end;
%if &i = 2009 %then %do;
      racedad1		341-342
%end;
%if &i = 2010 %then %do;
      racedad1		340-341
%end;
%if &i > 2010 %then %do;
      racedad1		341-342
%end;
%mend;

%macro mracedad;
%if &i > 1999 and &i < 2009 %then %do;
      mracedad	371
%end;
%if &i = 2009 %then %do;
      mracedad	512
%end;
%if &i > 2009 %then %do;
      mracedad	371
%end;
%mend;


%macro agedad;
%if &i = 1997 %then %do;
      agedad		119-120
%end;
%if &i = 1998 %then %do;
      agedad		329-330
%end;
%if &i > 1998 and &i < 2009 %then %do;
      agedad		119-120
%end;
%if &i = 2009 %then %do;
      agedad		339-340
%end;
%if &i > 2009 %then %do;
      agedad		119-120
%end;
%mend;

%macro prenatnum;
%if &i = 1997 %then %do;
      prenatnum		147-148
%end;
%if &i = 1998 %then %do;
      prenatnum		775-776
%end;
%if &i > 1998 and &i < 2009 %then %do;
      prenatnum		147-148
%end;
%if &i = 2009 %then %do;
      prenatnum		1073-1074
%end;
%if &i > 2009 %then %do;
      prenatnum		147-148
%end;
%mend;

%macro lnamedad;
%if &i = 1997 %then %do;
      LnameDad		$310-324
%end;
%if &i = 1998 %then %do;
      LnameDad		$244-276
%end;
%if &i = 2009 %then %do;
      LnameDad		$311-330
%end;
%if &i = 2010 %then %do;
      LnameDad		$310-324
%end;
%if &i > 2010 %then %do;
      LnameDad		$312-326
%end;
%mend;
%macro paybirth;
%if &i = 1997 %then %do;
      paybirth		368-369
%end;
%if &i = 1998 %then %do;
      paybirth		813-814
%end;
%if &i > 1998 and &i < 2009 %then %do;
      paybirth		368-369
%end;
%if &i = 2009 %then %do;
      paybirth		1211-1212
%end;
%if &i > 2009 %then %do;
      paybirth		368-369
%end;
%mend;

/*Extract macro utilizes the above macros to read in the source datasets*/
%macro extract(low, high);
%do i = &low %to &high; 
Data births&i;
infile "&bcfiles.&&in&i" missover lrecl= %datalength;
input 	%birthid
		%lnameinf
		%fnameinf
		%Mnameinf
		%sex
		%btype
		%bweight
		%gestation
		%yobinf
		%mobinf
		%dabinf
		%hospcode
		%county
		%Lnamemom
		%Fnamemom
		%agemom
		%resmom
		%dth_y
		%dth_m
		%dth_d
		%zipmom
		%lrd
		%yobmom
		%mobmom
		%dabmom
		%addmom
		%citymom
		%ssn
	    %sibs
		%ctract
		%racemom1
		%mracemom
		%racedad1
		%mracedad
		%agedad
		%prenatnum
		%lnamedad
		%paybirth;
run;
%end;
%mend;

/*Harmonize macro program cleans up the individual datasets and harmonizes variables*/
%macro harmonize(low, high);
%do i = &low %to &high; 
data births&i;
set births&i;
dobMom = mdy(mobMom, dabMom, yobMom);
dobinf = mdy(mobinf, dabinf, yobinf);
dodinf = mdy(dth_m, dth_d, dth_y);
id = _n_;
izid = catx('_', &i, id);
if ssn in('WITHHELD', 'UNK', 'UNKNOWN', 'NONE') then ssn = '';
/* harmonize county variables */
if county97 ^= '' then do;
	if county97 < '59' then county = input(compress(county97, '1234567890.', 'k'), 3.);
	if county97 = 'AL' then county = 101;
	if county97 = 'AK' then county = 102;
	if county97 = 'AZ' then county = 103;
	if county97 = 'AR' then county = 104;
	if county97 = 'CA' then county = 105;
	if county97 = 'CO' then county = 106;
	if county97 = 'CT' then county = 107;
	if county97 = 'DE' then county = 108;
	if county97 = 'DC' then county = 109;
	if county97 = 'FL' then county = 110;
	if county97 = 'GA' then county = 111;
	if county97 = 'HI' then county = 112;
	if county97 = 'ID' then county = 113;
	if county97 = 'IL' then county = 114;
	if county97 = 'IN' then county = 115;
	if county97 = 'IA' then county = 116;
	if county97 = 'KS' then county = 117;
	if county97 = 'KY' then county = 118;
	if county97 = 'LA' then county = 119;
	if county97 = 'ME' then county = 120;
	if county97 = 'MD' then county = 121;
	if county97 = 'MA' then county = 122;
	if county97 = 'MI' then county = 123;
	if county97 = 'MN' then county = 124;
	if county97 = 'MS' then county = 125;
	if county97 = 'MO' then county = 126;
	if county97 = 'MT' then county = 127;
	if county97 = 'NB' then county = 128;
	if county97 = 'NV' then county = 129;
	if county97 = 'NH' then county = 130;
	if county97 = 'NJ' then county = 131;
	if county97 = 'NM' then county = 132;
	if county97 = 'NY' then county = 133;
	if county97 = 'NC' then county = 134;
	if county97 = 'ND' then county = 135;
	if county97 = 'OH' then county = 136;
	if county97 = 'OK' then county = 137;
	if county97 = 'OR' then county = 138;
	if county97 = 'PA' then county = 139;
	if county97 = 'RI' then county = 140;
	if county97 = 'SC' then county = 141;
	if county97 = 'SD' then county = 142;
	if county97 = 'TN' then county = 143;
	if county97 = 'TX' then county = 144;
	if county97 = 'UT' then county = 145;
	if county97 = 'VT' then county = 146;
	if county97 = 'VA' then county = 147;
	if county97 = 'WA' then county = 148;
	if county97 = 'WV' then county = 149;
	if county97 = 'WI' then county = 150;
	if county97 = 'WY' then county = 151;
	if county97 > '90' and county97 < '98' then do;
		county = 998;
		if county97 = '91' then forcounty = 'CN';
		if county97 = '92' then forcounty = 'MX';
		if county97 = '93' then forcounty = 'XX';
		if county97 = '94' then forcounty = 'GU';
		if county97 = '95' then forcounty = 'PR';
		if county97 = '96' then forcounty = 'VI';
		if county97 = '97' then forcounty = 'CU';
	end;
end;
if county98 ^= '' then do;
	if county98 < '152' then county = input(compress(county98, '1234567890.', 'k'), 3.);
	if county98 > '151' then do;
		county = 998;
		if county98 = '200' then forcounty = 'CN';
		if county98 = '250' then forcounty = 'MX';
		if county98 = '301' then forcounty = 'CU';
		if county98 = '302' then forcounty = 'PR';
		if county98 = '303' then forcounty = 'VI';
		if county98 = '701' then forcounty = 'JA';
		if county98 = '702' then forcounty = 'PH';
		if county98 = '703' then forcounty = 'VM';
		if county98 = '750' then forcounty = 'CC';
		if county98 = '851' then forcounty = 'GU';
		if county98 = '998' then forcounty = 'XX';
	end;
end;
if county11 ^= '' then do;
	if county11 < '58' then county = input(compress(county11, '1234567890.', 'k'), 3.);
	if county11 = 'XX' then county = 999;
	if substr(county11,1,1) in ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z') then do;
		county = 998;
		forcounty = county11;
	end;
end;
/* harmonize resmom variables */
if resmom97 ^= '' then do;
	if resmom97 < '59' then resmom = input(compress(resmom97, '1234567890.', 'k'), 3.);
	if resmom97 = 'AL' then resmom = 101;
	if resmom97 = 'AK' then resmom = 102;
	if resmom97 = 'AZ' then resmom = 103;
	if resmom97 = 'AR' then resmom = 104;
	if resmom97 = 'CA' then resmom = 105;
	if resmom97 = 'CO' then resmom = 106;
	if resmom97 = 'CT' then resmom = 107;
	if resmom97 = 'DE' then resmom = 108;
	if resmom97 = 'DC' then resmom = 109;
	if resmom97 = 'FL' then resmom = 110;
	if resmom97 = 'GA' then resmom = 111;
	if resmom97 = 'HI' then resmom = 112;
	if resmom97 = 'ID' then resmom = 113;
	if resmom97 = 'IL' then resmom = 114;
	if resmom97 = 'IN' then resmom = 115;
	if resmom97 = 'IA' then resmom = 116;
	if resmom97 = 'KS' then resmom = 117;
	if resmom97 = 'KY' then resmom = 118;
	if resmom97 = 'LA' then resmom = 119;
	if resmom97 = 'ME' then resmom = 120;
	if resmom97 = 'MD' then resmom = 121;
	if resmom97 = 'MA' then resmom = 122;
	if resmom97 = 'MI' then resmom = 123;
	if resmom97 = 'MN' then resmom = 124;
	if resmom97 = 'MS' then resmom = 125;
	if resmom97 = 'MO' then resmom = 126;
	if resmom97 = 'MT' then resmom = 127;
	if resmom97 = 'NB' then resmom = 128;
	if resmom97 = 'NV' then resmom = 129;
	if resmom97 = 'NH' then resmom = 130;
	if resmom97 = 'NJ' then resmom = 131;
	if resmom97 = 'NM' then resmom = 132;
	if resmom97 = 'NY' then resmom = 133;
	if resmom97 = 'NC' then resmom = 134;
	if resmom97 = 'ND' then resmom = 135;
	if resmom97 = 'OH' then resmom = 136;
	if resmom97 = 'OK' then resmom = 137;
	if resmom97 = 'OR' then resmom = 138;
	if resmom97 = 'PA' then resmom = 139;
	if resmom97 = 'RI' then resmom = 140;
	if resmom97 = 'SC' then resmom = 141;
	if resmom97 = 'SD' then resmom = 142;
	if resmom97 = 'TN' then resmom = 143;
	if resmom97 = 'TX' then resmom = 144;
	if resmom97 = 'UT' then resmom = 145;
	if resmom97 = 'VT' then resmom = 146;
	if resmom97 = 'VA' then resmom = 147;
	if resmom97 = 'WA' then resmom = 148;
	if resmom97 = 'WV' then resmom = 149;
	if resmom97 = 'WI' then resmom = 150;
	if resmom97 = 'WY' then resmom = 151;
	if resmom97 > '90' and resmom97 < '98' then do;
		resmom = 998;
		if resmom97 = '91' then forresmom = 'CN';
		if resmom97 = '92' then forresmom = 'MX';
		if resmom97 = '93' then forresmom = 'XX';
		if resmom97 = '94' then forresmom = 'GU';
		if resmom97 = '95' then forresmom = 'PR';
		if resmom97 = '96' then forresmom = 'VI';
		if resmom97 = '97' then forresmom = 'CU';
	end;
end;
if resmom98 ^= '' then do;
	if resmom98 < '152' then resmom = input(compress(resmom98, '1234567890.', 'k'), 3.);
	if resmom98 > '151' then do;
		resmom = 998;
		if resmom98 = '200' then forresmom = 'CN';
		if resmom98 = '250' then forresmom = 'MX';
		if resmom98 = '301' then forresmom = 'CU';
		if resmom98 = '302' then forresmom = 'PR';
		if resmom98 = '303' then forresmom = 'VI';
		if resmom98 = '701' then forresmom = 'JA';
		if resmom98 = '702' then forresmom = 'PH';
		if resmom98 = '703' then forresmom = 'VM';
		if resmom98 = '750' then forresmom = 'CC';
		if resmom98 = '851' then forresmom = 'GU';
		if resmom98 = '998' then forresmom = 'XX';
	end;
end;
if resmom09 ^= '' then do;
	if resmom09 < '58' then resmom = input(compress(resmom09, '1234567890.', 'k'), 3.);
	if resmom09 = 'XX' then resmom = 999;
	if substr(resmom09,1,1) in ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z') then do;
		resmom = 998;
		forresmom = resmom09;
	end;
end;
/*create cabirth lhjbirth variables*/
if county < 59 then do;
	cabirth = 1;
	lhjbirth = county;
	if lrd in ('61', '62', '63') then lhjbirth = lrd;
end;
else cabirth = 0;
if county = . then cabirth = 0;
if resmom < 59 then do;
	caresmom = 1;
	lhjres = resmom;
	if citymom = 'BERKELEY' then lhjres = 61;
	if citymom = 'LONG BEACH' then lhjres = 62;
	if citymom = 'PASADENA' then lhjres = 63;
end;
else caresmom = 0;
if resmom = . then caresmom = 0;
drop county97 county98 county11 resmom97 resmom98 resmom09 yobinf  mobinf dabinf yobmom mobmom dabmom dth_m dth_d id;
format dobmom dobinf dodinf mmddyy10.;
run;

%end;
%mend;

/*Compile macro appends all the datasets together using the append macro and saves the allbirths file*/
%macro append(low, high);
%do i = &low %to &high;
	births&i
%end;
%mend;

%macro compile(low, high);
data allbirths;
set template
	%append(&low, &high);
run;

data "&bcfiles.\allbirths\allbirths";
set allbirths;
run;

%mend;

/*Distribute macro breaks up the allbirths file into specific years and saves them in the appropriate folders*/
%macro distribute(low, high);
%do i = &low %to &high;
	data "&bcfiles.&&out&i";
	set allbirths;
	if index(izid, "&i.") = 1;
	run;
%end;
%mend;

options mprint;

/*Invoke macro programs to run the code*/
%extract(1997, 2012);
%harmonize(1997, 2012);
%compile(1997, 2012);
%distribute(1997,2012);



