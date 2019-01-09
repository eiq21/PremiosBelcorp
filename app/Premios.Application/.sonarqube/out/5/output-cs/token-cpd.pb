Á
ÑC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Data.Context\Mapping\CampaniaConfiguration.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Data) -
.- .
Context. 5
.5 6
Mapping6 =
{ 
public 

class !
CampaniaConfiguration &
:' ($
IEntityTypeConfiguration) A
<A B
CampaniaB J
>J K
{		 
public

 
void

 
	Configure

 
(

 
EntityTypeBuilder

 /
<

/ 0
Campania

0 8
>

8 9
builder

: A
)

A B
{ 	
builder 
. 
ToTable 
( 
$str &
)& '
;' (
builder 
. 
HasKey 
( 
c 
=> 
c  !
.! "

CampaniaId" ,
), -
;- .
} 	
} 
} è
áC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Data.Context\Mapping\CampaniaUrlConfiguracion.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Data) -
.- .
Context. 5
.5 6
Mapping6 =
{		 
public

 

class

 $
CampaniaUrlConfiguracion

 )
:

* +$
IEntityTypeConfiguration

, D
<

D E
CampaniaUrl

E P
>

P Q
{ 
public 
void 
	Configure 
( 
EntityTypeBuilder /
</ 0
CampaniaUrl0 ;
>; <
builder= D
)D E
{ 	
builder 
. 
ToTable 
( 
$str )
)) *
;* +
builder 
. 
HasKey 
( 
c 
=> 
c  !
.! "
CampaniaUrlId" /
)/ 0
;0 1
builder 
. 
HasOne 
( 
p 
=> 
p  !
.! "
Campania" *
)* +
. 
WithMany 
( 
b 
=> 
b 
. 
CampaniaUrls +
)+ ,
. 
HasForeignKey 
( 
p 
=> !
p" #
.# $

CampaniaId$ .
). /
. 
HasConstraintName  
(  !
$str! :
): ;
;; <
builder 
. 
HasOne 
( 
p 
=> 
p  !
.! "
TipoUrl" )
)) *
. 
WithMany 
( 
b 
=> 
b 
. 
CampaniaUrls +
)+ ,
. 
HasForeignKey 
( 
p 
=> !
p" #
.# $

CampaniaId$ .
). /
. 
HasConstraintName  
(  !
$str! 9
)9 :
;: ;
} 	
} 
} •
ÇC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Data.Context\Mapping\EquipoConfiguration.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Data) -
.- .
Context. 5
.5 6
Mapping6 =
{		 
public

 

class

 
EquipoConfiguration

 $
:

% &$
IEntityTypeConfiguration

' ?
<

? @
Equipo

@ F
>

F G
{ 
public 
void 
	Configure 
( 
EntityTypeBuilder /
</ 0
Equipo0 6
>6 7
builder8 ?
)? @
{ 	
builder 
. 
ToTable 
( 
$str $
)$ %
;% &
builder 
. 
HasKey 
( 
c 
=> 
c  !
.! "
EquipoId" *
)* +
;+ ,
builder 
. 
HasOne 
( 
p 
=> 
p  !
.! "
Campania" *
)* +
. 
WithMany 
( 
b 
=> 
b  !
.! "
Equipos" )
)) *
. 
HasForeignKey 
(  
p  !
=>" $
p% &
.& '

CampaniaId' 1
)1 2
. 
HasConstraintName #
(# $
$str$ 8
)8 9
;9 :
} 	
} 
} ¸
ÖC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Data.Context\Mapping\EquipoUrlConfiguration.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Data) -
.- .
Context. 5
.5 6
Mapping6 =
{		 
public

 

class

 "
EquipoUrlConfiguration

 '
:

( )$
IEntityTypeConfiguration

* B
<

B C
	EquipoUrl

C L
>

L M
{ 
public 
void 
	Configure 
( 
EntityTypeBuilder /
</ 0
	EquipoUrl0 9
>9 :
builder; B
)B C
{ 	
builder 
. 
ToTable 
( 
$str '
)' (
;( )
builder 
. 
HasKey 
( 
c 
=> 
c  !
.! "
EquipoUrlId" -
)- .
;. /
builder 
. 
HasOne 
( 
p 
=> 
p  !
.! "
Equipo" (
)( )
. 
WithMany 
( 
b 
=> 
b  !
.! "

EquipoUrls" ,
), -
. 
HasForeignKey 
(  
p  !
=>" $
p% &
.& '
EquipoId' /
)/ 0
. 
HasConstraintName #
(# $
$str$ 9
)9 :
;: ;
builder 
. 
HasOne 
( 
p 
=> 
p  !
.! "
TipoUrl" )
)) *
. 
WithMany 
( 
b 
=> 
b  !
.! "

EquipoUrls" ,
), -
. 
HasForeignKey 
(  
p  !
=>" $
p% &
.& '
	TipoUrlId' 0
)0 1
. 
HasConstraintName #
(# $
$str$ :
): ;
;; <
} 	
} 
} ‚
ÉC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Data.Context\Mapping\TipoUrlConfiguration.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Data) -
.- .
Context. 5
.5 6
Mapping6 =
{		 
public

 

class

  
TipoUrlConfiguration

 %
:

& '$
IEntityTypeConfiguration

( @
<

@ A
TipoUrl

A H
>

H I
{ 
public 
void 
	Configure 
( 
EntityTypeBuilder /
</ 0
TipoUrl0 7
>7 8
builder9 @
)@ A
{ 	
builder 
. 
ToTable 
( 
$str %
)% &
;& '
builder 
. 
HasKey 
( 
c 
=> 
c  !
.! "
	TipoUrlId" +
)+ ,
;, -
} 	
} 
} ˚
àC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Data.Context\Mapping\UsuarioAdminConfiguration.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Data) -
.- .
Context. 5
.5 6
Mapping6 =
{		 
public

 

class

 %
UsuarioAdminConfiguration

 *
:

+ ,$
IEntityTypeConfiguration

- E
<

E F
UsuarioAdmin

F R
>

R S
{ 
public 
void 
	Configure 
( 
EntityTypeBuilder /
</ 0
UsuarioAdmin0 <
>< =
builder> E
)E F
{ 	
builder 
. 
ToTable 
( 
$str *
)* +
;+ ,
builder 
. 
HasKey 
( 
c 
=> 
c  !
.! "
UsuarioAdminId" 0
)0 1
;1 2
} 	
} 
} Ö	
äC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Data.Context\Mapping\UsuarioExternoConfiguration.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Data) -
.- .
Context. 5
.5 6
Mapping6 =
{		 
public

 

class

 '
UsuarioExternoConfiguration

 ,
:

- .$
IEntityTypeConfiguration

/ G
<

G H
UsuarioExterno

H V
>

V W
{ 
public 
void 
	Configure 
( 
EntityTypeBuilder /
</ 0
UsuarioExterno0 >
>> ?
builder@ G
)G H
{ 	
builder 
. 
ToTable 
( 
$str ,
), -
;- .
builder 
. 
HasKey 
( 
c 
=> 
c  !
.! "
UsuarioExternoId" 2
)2 3
;3 4
} 	
} 
} ≠
ÑC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Data.Context\Mapping\VotacionConfiguration.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Data) -
.- .
Context. 5
.5 6
Mapping6 =
{		 
public

 

class

 !
VotacionConfiguration

 &
:

' ($
IEntityTypeConfiguration

) A
<

A B
Votacion

B J
>

J K
{ 
public 
void 
	Configure 
( 
EntityTypeBuilder /
</ 0
Votacion0 8
>8 9
builder: A
)A B
{ 	
builder 
. 
ToTable 
( 
$str &
)& '
;' (
builder 
. 
HasKey 
( 
c 
=> 
c  !
.! "

VotacionId" ,
), -
;- .
builder 
. 
HasOne 
( 
p 
=> 
p  !
.! "
Equipo" (
)( )
. 
WithMany 
( 
b 
=> 
b  !
.! "
	Votacions" +
)+ ,
. 
HasForeignKey 
(  
p  !
=>" $
p% &
.& '
EquipoId' /
)/ 0
. 
HasConstraintName #
(# $
$str$ 8
)8 9
;9 :
} 	
} 
} ‹[
uC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Data.Context\PremiosContext.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Data) -
.- .
Context. 5
{ 
public 

class 
PremiosContext 
:  !
	DbContext" +
{ 
private 
readonly 

IPrincipal #

_principal$ .
;. /
public 
PremiosContext 
( 
DbContextOptions .
<. /
PremiosContext/ =
>= >
options? F
,F G

IPrincipalH R
	principalS \
)\ ]
:^ _
base` d
(e f
optionsf m
)m n
{ 	

_principal 
= 
	principal "
;" #
} 	
public 
PremiosContext 
( 
DbContextOptions .
<. /
PremiosContext/ =
>= >
options? F
)F G
:H I
baseJ N
(N O
optionsO V
)V W
{ 	

_principal 
= 
null 
; 
} 	
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
modelBuilder   
.   
EnableAutoHistory   *
(  * +
null  + /
)  / 0
;  0 1
modelBuilder## 
.## 
ApplyConfiguration## +
(##+ ,
new##, / 
TipoUrlConfiguration##0 D
(##D E
)##E F
)##F G
;##G H
modelBuilder$$ 
.$$ 
ApplyConfiguration$$ +
($$+ ,
new$$, /!
CampaniaConfiguration$$0 E
($$E F
)$$F G
)$$G H
;$$H I
modelBuilder%% 
.%% 
ApplyConfiguration%% +
(%%+ ,
new%%, /$
CampaniaUrlConfiguracion%%0 H
(%%H I
)%%I J
)%%J K
;%%K L
modelBuilder&& 
.&& 
ApplyConfiguration&& +
(&&+ ,
new&&, /%
UsuarioAdminConfiguration&&0 I
(&&I J
)&&J K
)&&K L
;&&L M
modelBuilder'' 
.'' 
ApplyConfiguration'' +
(''+ ,
new'', /
EquipoConfiguration''0 C
(''C D
)''D E
)''E F
;''F G
modelBuilder(( 
.(( 
ApplyConfiguration(( +
(((+ ,
new((, /"
EquipoUrlConfiguration((0 F
(((F G
)((G H
)((H I
;((I J
modelBuilder)) 
.)) 
ApplyConfiguration)) +
())+ ,
new)), /!
VotacionConfiguration))0 E
())E F
)))F G
)))G H
;))H I
modelBuilder** 
.** 
ApplyConfiguration** +
(**+ ,
new**, /'
UsuarioExternoConfiguration**0 K
(**K L
)**L M
)**M N
;**N O
base.. 
... 
OnModelCreating..  
(..  !
modelBuilder..! -
)..- .
;... /
}// 	
public00 
virtual00 
DbSet00 
<00 
Campania00 %
>00% &
Campania00' /
{000 1
get002 5
;005 6
set007 :
;00: ;
}00< =
public11 
virtual11 
DbSet11 
<11 
UsuarioAdmin11 )
>11) *
UsuarioAdmin11+ 7
{118 9
get11: =
;11= >
set11? B
;11B C
}11D E
public22 
virtual22 
DbSet22 
<22 
CampaniaUrl22 (
>22( )
CampaniaUrl22* 5
{226 7
get228 ;
;22; <
set22= @
;22@ A
}22B C
public33 
virtual33 
DbSet33 
<33 
TipoUrl33 $
>33$ %
TipoUrl33& -
{33. /
get330 3
;333 4
set335 8
;338 9
}33: ;
public44 
virtual44 
DbSet44 
<44 
Equipo44 #
>44# $
Equipo44% +
{44, -
get44. 1
;441 2
set443 6
;446 7
}448 9
public55 
virtual55 
DbSet55 
<55 
	EquipoUrl55 &
>55& '
	EquipoUrl55( 1
{552 3
get554 7
;557 8
set559 <
;55< =
}55> ?
public66 
virtual66 
DbSet66 
<66 
Votacion66 %
>66% &
Votacion66' /
{660 1
get662 5
;665 6
set667 :
;66: ;
}66< =
public77 
virtual77 
DbSet77 
<77 
UsuarioExterno77 +
>77+ ,
UsuarioExterno77- ;
{77< =
get77> A
;77A B
set77C F
;77F G
}77H I
public99 
override99 
int99 
SaveChanges99 '
(99' (
)99( )
{:: 	
this;; 
.;; 
AuditEntities;; 
(;; 
);;  
;;;  !
return<< 
base<< 
.<< 
SaveChanges<< #
(<<# $
)<<$ %
;<<% &
}== 	
private?? 
void?? 
AuditEntities?? "
(??" #
)??# $
{@@ 	
ifAA 
(AA 

_principalAA 
==AA 
nullAA "
)AA" #
{BB 
returnCC 
;CC 
}DD 
stringFF 
userNameFF 
=FF 

_principalFF (
.FF( )
IdentityFF) 1
.FF1 2
NameFF2 6
;FF6 7
DateTimeGG 
nowGG 
=GG 
DateTimeGG #
.GG# $
NowGG$ '
;GG' (
foreachII 
(II 
EntityEntryII  
entryII! &
inII' )
ChangeTrackerII* 7
.II7 8
EntriesII8 ?
(II? @
)II@ A
)IIA B
{JJ 
ifLL 
(LL 
entryLL 
.LL 
StateLL 
==LL  "
EntityStateLL# .
.LL. /
AddedLL/ 4
)LL4 5
{MM 
ifNN 
(NN 
entryNN 
.NN 

PropertiesNN (
.NN( )
WhereNN) .
(NN. /
pNN/ 0
=>NN1 3
pNN4 5
.NN5 6
MetadataNN6 >
.NN> ?
NameNN? C
.NNC D
ToLowerNND K
(NNK L
)NNL M
==NNN P
$strNNQ b
.NNb c
ToLowerNNc j
(NNj k
)NNk l
)NNl m
.NNm n
AnyNNn q
(NNq r
)NNr s
)NNs t
{OO 
entryPP 
.PP 
PropertyPP &
(PP& '
$strPP' 8
)PP8 9
.PP9 :
CurrentValuePP: F
=PPG H
userNamePPI Q
;PPQ R
}QQ 
ifRR 
(RR 
entryRR 
.RR 

PropertiesRR (
.RR( )
WhereRR) .
(RR. /
pRR/ 0
=>RR1 3
pRR4 5
.RR5 6
MetadataRR6 >
.RR> ?
NameRR? C
.RRC D
ToLowerRRD K
(RRK L
)RRL M
==RRN P
$strRRQ b
.RRb c
ToLowerRRc j
(RRj k
)RRk l
)RRl m
.RRm n
AnyRRn q
(RRq r
)RRr s
)RRs t
{SS 
entryTT 
.TT 
PropertyTT &
(TT& '
$strTT' 6
)TT6 7
.TT7 8
CurrentValueTT8 D
=TTE F
nowTTG J
;TTJ K
}UU 
ifVV 
(VV 
entryVV 
.VV 

PropertiesVV (
.VV( )
WhereVV) .
(VV. /
pVV/ 0
=>VV1 3
pVV4 5
.VV5 6
MetadataVV6 >
.VV> ?
NameVV? C
.VVC D
ToLowerVVD K
(VVK L
)VVL M
==VVN P
$strVVQ f
.VVf g
ToLowerVVg n
(VVn o
)VVo p
)VVp q
.VVq r
AnyVVr u
(VVu v
)VVv w
)VVw x
{WW 
entryXX 
.XX 
PropertyXX &
(XX& '
$strXX' <
)XX< =
.XX= >
CurrentValueXX> J
=XXK L
userNameXXM U
;XXU V
}YY 
ifZZ 
(ZZ 
entryZZ 
.ZZ 

PropertiesZZ (
.ZZ( )
WhereZZ) .
(ZZ. /
pZZ/ 0
=>ZZ1 3
pZZ4 5
.ZZ5 6
MetadataZZ6 >
.ZZ> ?
NameZZ? C
.ZZC D
ToLowerZZD K
(ZZK L
)ZZL M
==ZZN P
$strZZQ d
.ZZd e
ToLowerZZe l
(ZZl m
)ZZm n
)ZZn o
.ZZo p
AnyZZp s
(ZZs t
)ZZt u
)ZZu v
{[[ 
entry\\ 
.\\ 
Property\\ &
(\\& '
$str\\' :
)\\: ;
.\\; <
CurrentValue\\< H
=\\I J
now\\K N
;\\N O
}]] 
}^^ 
else__ 
if__ 
(__ 
entry__ 
.__ 
State__ $
==__% '
EntityState__( 3
.__3 4
Modified__4 <
)__< =
{`` 
entryaa 
.aa 
Propertyaa "
(aa" #
$straa# 2
)aa2 3
.aa3 4

IsModifiedaa4 >
=aa? @
falseaaA F
;aaF G
entrybb 
.bb 
Propertybb "
(bb" #
$strbb# 4
)bb4 5
.bb5 6

IsModifiedbb6 @
=bbA B
falsebbC H
;bbH I
ifcc 
(cc 
entrycc 
.cc 

Propertiescc (
.cc( )
Wherecc) .
(cc. /
pcc/ 0
=>cc1 3
pcc4 5
.cc5 6
Metadatacc6 >
.cc> ?
Namecc? C
.ccC D
ToLowerccD K
(ccK L
)ccL M
==ccN P
$strccQ f
.ccf g
ToLowerccg n
(ccn o
)cco p
)ccp q
.ccq r
Anyccr u
(ccu v
)ccv w
)ccw x
{dd 
entryee 
.ee 
Propertyee &
(ee& '
$stree' <
)ee< =
.ee= >
CurrentValueee> J
=eeK L
userNameeeM U
;eeU V
}ff 
ifgg 
(gg 
entrygg 
.gg 

Propertiesgg (
.gg( )
Wheregg) .
(gg. /
pgg/ 0
=>gg1 3
pgg4 5
.gg5 6
Metadatagg6 >
.gg> ?
Namegg? C
.ggC D
ToLowerggD K
(ggK L
)ggL M
==ggN P
$strggQ d
.ggd e
ToLowergge l
(ggl m
)ggm n
)ggn o
.ggo p
Anyggp s
(ggs t
)ggt u
)ggu v
{hh 
entryii 
.ii 
Propertyii &
(ii& '
$strii' :
)ii: ;
.ii; <
CurrentValueii< H
=iiI J
nowiiK N
;iiN O
}jj 
}kk 
}ll 
}mm 	
}nn 
}oo 