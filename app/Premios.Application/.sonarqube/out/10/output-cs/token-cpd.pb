ê
îC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\AuthenticationModule\Service\AuthenticationAppService.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Application %
.% &
Context& -
.- . 
AuthenticationModule. B
.B C
ServiceC J
{ 
public 

class $
AuthenticationAppService )
:* +%
IAuthenticationAppService, E
{ 
private 
readonly 

ILDAPAgent #

_ldapAgent$ .
;. /
private 
readonly 
IUnitOfWork $
<$ %
PremiosContext% 3
>3 4
_unitOfWork5 @
;@ A
public $
AuthenticationAppService '
(' (
IUnitOfWork 
< 
PremiosContext &
>& '

unitOfWork( 2
,2 3

ILDAPAgent 
	ldapAgent  
)  !
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %

_ldapAgent 
= 
	ldapAgent "
;" #
} 	
public 
UserDetailProfile  
getDetailProfile! 1
(1 2
string2 8
username9 A
)A B
{ 	
UserDetailProfile 
udp !
=" #
_unitOfWork$ /
./ 0
ExecuteSqlQuery0 ?
<? @
UserDetailProfile@ Q
>Q R
(R S
$strS o
,o p
newq t#
GetUserDetailParameter	u ã
(
ã å
)
å ç
{
é è
UserName
ê ò
=
ô ö
username
õ £
}
§ •
)
¶ ß
.
ß ®
FirstOrDefault
® ∂
(
∂ ∑
)
∑ ∏
;
∏ π
return   
udp   
;   
}!! 	
public## 
bool## 
ValidateUser##  
(##  !
string##! '
username##( 0
,##0 1
string##2 8
password##9 A
)##A B
{$$ 	
bool%% 
valid%% 
=%% 
false%% 
;%% 
var'' 
externo'' 
='' 
('' 
from'' 
x''  !
in''" $
_unitOfWork''% 0
.''0 1
	DbContext''1 :
.'': ;
UsuarioExterno''; I
where((  
x((! "
.((" #
NroDocumento((# /
==((0 2
username((3 ;
&&)) 
x)) 
.))  
Activo))  &
&&))' )
!))* +
x))+ ,
.)), -
	Eliminado))- 6
select** !
x**" #
)**# $
.**$ %
FirstOrDefault**% 3
(**3 4
)**4 5
;**5 6
if,, 
(,, 
externo,, 
==,, 
null,, 
||,,  "
externo,,# *
.,,* +
UsuarioExternoId,,+ ;
==,,< >
$num,,? @
),,@ A
{-- 
valid.. 
=.. 

_ldapAgent.. "
..." #
ValidateUser..# /
(../ 0
new..0 3
ValidateUserRequest..4 G
{// 
Username00 
=00 
username00 '
,00' (
Password11 
=11 
password11 '
}22 
)22 
.22 
isLoginTrue22 
;22 
}33 
else44 
{55 
valid66 
=66 
EncryptHelper66 %
.66% &
Decrypt66& -
(66- .
externo66. 5
.665 6
Clave666 ;
)66; <
==66= ?
password66@ H
;66H I
}77 
return99 
valid99 
;99 
};; 	
}<< 
}== ·
ïC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\AuthenticationModule\Service\IAuthenticationAppService.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Application %
.% &
Context& -
.- . 
AuthenticationModule. B
.B C
ServiceC J
{ 
public 

	interface %
IAuthenticationAppService .
{		 
bool

 
ValidateUser

 
(

 
string

  
username

! )
,

) *
string

+ 1
password

2 :
)

: ;
;

; <
UserDetailProfile 
getDetailProfile *
(* +
string+ 1
username2 :
): ;
;; <
} 
} ó
ïC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\AuthenticationModule\Specifications\IUserSpecification.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Application %
.% &
Context& -
.- . 
AuthenticationModule. B
.B C
SpecificationsC Q
{ 
public 

	interface 
IUserSpecification '
{ 
bool		 
IsAdministrator		 
(		 
string		 #
username		$ ,
)		, -
;		- .
}

 
}  
îC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\AuthenticationModule\Specifications\UserSpecification.cs
	namespace		 	
Belcorp		
 
.		 
Premios		 
.		 
Application		 %
.		% &
Context		& -
.		- . 
AuthenticationModule		. B
.		B C
Specifications		C Q
{

 
public 

class 
UserSpecification "
:# $
IUserSpecification% 7
{ 
private 
readonly 
IUnitOfWork $
<$ %
PremiosContext% 3
>3 4
_unitOfWork5 @
;@ A
public 
UserSpecification  
(  !
IUnitOfWork! ,
<, -
PremiosContext- ;
>; <

unitOfWork= G
)G H
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
} 	
public 
bool 
IsAdministrator #
(# $
string$ *
username+ 3
)3 4
{ 	
bool 
isAdministrator  
=! "
false# (
;( )
var 
user 
= 
( 
from 
u 
in !
_unitOfWork" -
.- .
	DbContext. 7
.7 8
UsuarioAdmin8 D
where 
u  
.  !

CodUsuario! +
.+ ,
ToUpper, 3
(3 4
)4 5
==6 8
username9 A
.A B
ToUpperB I
(I J
)J K
&& 
! 
u 
. 
	Eliminado (
select 
u  !
)! "
." #
FirstOrDefault# 1
(1 2
)2 3
;3 4
if 
( 
user 
!= 
null 
) 
{ 
isAdministrator   
=    !
true  " &
;  & '
}!! 
return## 
isAdministrator## "
;##" #
}$$ 	
}%% 
}&& äÌ
ÇC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\AwardModule\Service\AwardAppService.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Application %
.% &
Context& -
.- .
AwardModule. 9
.9 :
Service: A
{ 
public 

class 
AwardAppService  
:! "
IAwardAppService# 3
{ 
private 
readonly 
IUnitOfWork $
<$ %
PremiosContext% 3
>3 4
_unitOfWork5 @
;@ A
private 
readonly 
IClosedXMLAgent (
_closedXMLAgent) 8
;8 9
public 
AwardAppService 
( 
IUnitOfWork 
< 
PremiosContext &
>& '

unitOfWork( 2
,2 3
IClosedXMLAgent 
closedXMLAgent *
)   	
{  
 
_unitOfWork!! 
=!! 

unitOfWork!! $
;!!$ %
_closedXMLAgent"" 
="" 
closedXMLAgent"" ,
;"", -
}## 	
private%% 
int%% 
?%% 
GetActiveCampaign%% &
(%%& '
)%%' (
{&& 	
int'' 
?'' 
activeCampaign'' 
=''  !
(''" #
from''# '
cu''( *
in''+ -
_unitOfWork''. 9
.''9 :
	DbContext'': C
.''C D
CampaniaUrl''D O
where((# (
cu(() +
.((+ ,
Activo((, 2
&&((3 5
!((6 7
cu((7 9
.((9 :
	Eliminado((: C
select))# )
cu))* ,
.)), -

CampaniaId))- 7
)))7 8
.))8 9
FirstOrDefault))9 G
())G H
)))H I
;))I J
return++ 
activeCampaign++ !
;++! "
},, 	
public.. 
ICollection.. 
<.. 
CampaignUrl.. &
>..& '!
ListBannersByCampaign..( =
(..= >
)..> ?
{// 	
int00 
?00 
activeCampaign00 
=00  !
this00" &
.00& '
GetActiveCampaign00' 8
(008 9
)009 :
;00: ;
var22 
query22 
=22 
(22 
from22 
cu22  
in22! #
_unitOfWork22$ /
.22/ 0
	DbContext220 9
.229 :
CampaniaUrl22: E
join33 
c33 
in33  "
_unitOfWork33# .
.33. /
	DbContext33/ 8
.338 9
Campania339 A
on33B D
cu33E G
.33G H

CampaniaId33H R
equals33S Y
c33Z [
.33[ \

CampaniaId33\ f
join44 
t44 
in44  "
_unitOfWork44# .
.44. /
	DbContext44/ 8
.448 9
TipoUrl449 @
on44A C
cu44D F
.44F G
	TipoUrlId44G P
equals44Q W
t44X Y
.44Y Z
	TipoUrlId44Z c
where55 
cu55 !
.55! "

CampaniaId55" ,
==55- /
activeCampaign550 >
.55> ?
Value55? D
&&55E G
c55H I
.55I J
Activo55J P
&&55R T
!55U V
c55V W
.55W X
	Eliminado55X a
&&55b d
cu66 !
.66! "
Activo66" (
&&66* ,
!66- .
cu66. 0
.660 1
	Eliminado661 :
select77 
new77  #
CampaignUrl77$ /
(77/ 0
)770 1
{88 
CampaignUrlId99 *
=99+ ,
cu99- /
.99/ 0
CampaniaUrlId990 =
,99= >
	TypeUrlId:: &
=::' (
cu::) +
.::+ ,
	TipoUrlId::, 5
,::5 6

Sequential;; '
=;;( )
t;;* +
.;;+ ,

Secuencial;;, 6
,;;6 7
ValueUrl<< %
=<<& '
cu<<( *
.<<* +
ValorUrl<<+ 3
,<<3 4
Description== (
===) *
cu==+ -
.==- .
Descripcion==. 9
}>> 
)>> 
;>> 
var?? 
lstCampaignUrl?? 
=??  
query??! &
.??& '
ToList??' -
(??- .
)??. /
;??/ 0
returnAA 
lstCampaignUrlAA !
;AA! "
}BB 	
publicDD 
ICollectionDD 
<DD 
TilesDD  
>DD  !
	ListTilesDD" +
(DD+ ,
)DD, -
{EE 	
intFF 
?FF 
activeCampaignFF 
=FF  !
thisFF" &
.FF& '
GetActiveCampaignFF' 8
(FF8 9
)FF9 :
;FF: ;
intGG 
[GG 
]GG 
typesUrlGG 
=GG 
newGG  
intGG! $
[GG$ %
]GG% &
{GG' (
(GG) *
intGG* -
)GG- .
EnumsGG. 3
.GG3 4
TiposUrlGG4 <
.GG< =
VideoBaldosaGG= I
,GGI J
(GGK L
intGGL O
)GGO P
EnumsGGP U
.GGU V
TiposUrlGGV ^
.GG^ _
FotoBaldosaGG_ j
}GGk l
;GGl m
ListHH 
<HH 
TilesHH 
>HH 
lstTilesHH  
=HH! "
newHH# &
ListHH' +
<HH+ ,
TilesHH, 1
>HH1 2
(HH2 3
)HH3 4
;HH4 5
TilesII 
objTileII 
=II 
nullII  
;II  !
varKK 

resultBaseKK 
=KK 
(KK 
fromKK "
eKK# $
inKK% '
_unitOfWorkKK( 3
.KK3 4
	DbContextKK4 =
.KK= >
EquipoKK> D
joinLL 
eqLL  
inLL! #
_unitOfWorkLL$ /
.LL/ 0
	DbContextLL0 9
.LL9 :
	EquipoUrlLL: C
onLLD F
eLLG H
.LLH I
EquipoIdLLI Q
equalsLLR X
eqLLY [
.LL[ \
EquipoIdLL\ d
joinMM 
tMM 
inMM  "
_unitOfWorkMM# .
.MM. /
	DbContextMM/ 8
.MM8 9
TipoUrlMM9 @
onMMA C
eqMMD F
.MMF G
	TipoUrlIdMMG P
equalsMMQ W
tMMX Y
.MMY Z
	TipoUrlIdMMZ c
whereNN 
typesUrlNN '
.NN' (
ContainsNN( 0
(NN0 1
tNN1 2
.NN2 3

SecuencialNN3 =
)NN= >
&&NN? A
eNNB C
.NNC D

CampaniaIdNND N
==NNO Q
activeCampaignNNR `
.NN` a
ValueNNa f
selectOO 
newOO  #
{PP 
TeamIdQQ #
=QQ$ %
eQQ& '
.QQ' (
EquipoIdQQ( 0
,QQ0 1
	TypeUrlIdRR &
=RR' (
eqRR) +
.RR+ ,
	TipoUrlIdRR, 5
,RR5 6
NameSS !
=SS" #
eSS$ %
.SS% &
NombreSS& ,
,SS, -
DescriptionTT (
=TT) *
eTT+ ,
.TT, -
DescripcionTT- 8
,TT8 9
ValueUrlUU %
=UU& '
eqUU( *
.UU* +
ValorUrlUU+ 3
,UU3 4

SequentialVV '
=VV( )
tVV* +
.VV+ ,

SecuencialVV, 6
}WW 
)WW 
.WW 
ToListWW "
(WW" #
)WW# $
;WW$ %
foreachYY 
(YY 
varYY 
tileYY 
inYY  

resultBaseYY! +
)YY+ ,
{ZZ 
objTile[[ 
=[[ 
new[[ 
Tiles[[ #
([[# $
)[[$ %
;[[% &
var]] 
t]] 
=]] 
lstTiles]]  
.]]  !
Where]]! &
(]]& '
x]]' (
=>]]) +
x]], -
.]]- .
TeamId]]. 4
==]]5 7
tile]]8 <
.]]< =
TeamId]]= C
)]]C D
;]]D E
if__ 
(__ 
!__ 
t__ 
.__ 
Any__ 
(__ 
)__ 
)__ 
{`` 
objTileaa 
.aa 
TeamIdaa "
=aa# $
tileaa% )
.aa) *
TeamIdaa* 0
;aa0 1
objTilebb 
.bb 
	TypeUrlIdbb %
=bb& '
tilebb( ,
.bb, -
	TypeUrlIdbb- 6
;bb6 7
objTilecc 
.cc 

Sequentialcc &
=cc' (
tilecc) -
.cc- .

Sequentialcc. 8
;cc8 9
objTiledd 
.dd 
Namedd  
=dd! "
tiledd# '
.dd' (
Namedd( ,
;dd, -
objTileee 
.ee 
Descriptionee '
=ee( )
tileee* .
.ee. /
Descriptionee/ :
;ee: ;
ifff 
(ff 
tileff 
.ff 

Sequentialff '
==ff( *
(ff+ ,
intff, /
)ff/ 0
Enumsff0 5
.ff5 6
TiposUrlff6 >
.ff> ?
VideoBaldosaff? K
)ffK L
{ffM N
objTilegg 
.gg   
VideoPreviewValueUrlgg  4
=gg5 6
tilegg7 ;
.gg; <
ValueUrlgg< D
;ggD E
}hh 
ifjj 
(jj 
tilejj 
.jj 

Sequentialjj '
==jj( *
(jj+ ,
intjj, /
)jj/ 0
Enumsjj0 5
.jj5 6
TiposUrljj6 >
.jj> ?
FotoBaldosajj? J
)jjJ K
{jjL M
objTilekk 
.kk  
ImageValueUrlkk  -
=kk. /
tilekk0 4
.kk4 5
ValueUrlkk5 =
;kk= >
}ll 
lstTilesnn 
.nn 
Addnn  
(nn  !
objTilenn! (
)nn( )
;nn) *
}oo 
elsepp 
{qq 
varrr 
objrr 
=rr 
trr 
.rr  
FirstOrDefaultrr  .
(rr. /
)rr/ 0
;rr0 1
ifss 
(ss 
tiless 
.ss 

Sequentialss '
==ss( *
(ss+ ,
intss, /
)ss/ 0
Enumsss0 5
.ss5 6
TiposUrlss6 >
.ss> ?
VideoBaldosass? K
)ssK L
{tt 
objuu 
.uu  
VideoPreviewValueUrluu 0
=uu1 2
tileuu3 7
.uu7 8
ValueUrluu8 @
;uu@ A
}vv 
ifxx 
(xx 
tilexx 
.xx 

Sequentialxx '
==xx( *
(xx+ ,
intxx, /
)xx/ 0
Enumsxx0 5
.xx5 6
TiposUrlxx6 >
.xx> ?
FotoBaldosaxx? J
)xxJ K
{yy 
objzz 
.zz 
ImageValueUrlzz )
=zz* +
tilezz, 0
.zz0 1
ValueUrlzz1 9
;zz9 :
}{{ 
}|| 
}~~ 
return
ÅÅ 
lstTiles
ÅÅ 
.
ÅÅ 
OrderBy
ÅÅ #
(
ÅÅ# $
x
ÅÅ$ %
=>
ÅÅ& (
Guid
ÅÅ) -
.
ÅÅ- .
NewGuid
ÅÅ. 5
(
ÅÅ5 6
)
ÅÅ6 7
)
ÅÅ7 8
.
ÅÅ8 9
ToList
ÅÅ9 ?
(
ÅÅ? @
)
ÅÅ@ A
;
ÅÅA B
}
ÉÉ 	
public
ÖÖ 
ICollection
ÖÖ 
<
ÖÖ 
DetailByTeam
ÖÖ '
>
ÖÖ' (
ListDetailByTeam
ÖÖ) 9
(
ÖÖ9 :
int
ÖÖ: =
teamId
ÖÖ> D
,
ÖÖD E
string
ÖÖF L
codeUser
ÖÖM U
)
ÖÖU V
{
ÜÜ 	
int
áá 
?
áá 
activeCampaign
áá 
=
áá  !
this
áá" &
.
áá& '
GetActiveCampaign
áá' 8
(
áá8 9
)
áá9 :
;
áá: ;
var
ââ 
query
ââ 
=
ââ 
(
ââ 
from
ââ 
e
ââ 
in
ââ  "
_unitOfWork
ââ# .
.
ââ. /
	DbContext
ââ/ 8
.
ââ8 9
Equipo
ââ9 ?
join
ää 
eu
ää  
in
ää! #
_unitOfWork
ää$ /
.
ää/ 0
	DbContext
ää0 9
.
ää9 :
	EquipoUrl
ää: C
on
ääD F
e
ääG H
.
ääH I
EquipoId
ääI Q
equals
ääR X
eu
ääY [
.
ää[ \
EquipoId
ää\ d
join
ãã 
t
ãã 
in
ãã  "
_unitOfWork
ãã# .
.
ãã. /
	DbContext
ãã/ 8
.
ãã8 9
TipoUrl
ãã9 @
on
ããA C
eu
ããD F
.
ããF G
	TipoUrlId
ããG P
equals
ããQ W
t
ããX Y
.
ããY Z
	TipoUrlId
ããZ c
join
åå 
v
åå 
in
åå  "
_unitOfWork
åå# .
.
åå. /
	DbContext
åå/ 8
.
åå8 9
Votacion
åå9 A
.
ååA B
Where
ååB G
(
ååG H
x
ååH I
=>
ååJ L
x
ååM N
.
ååN O

CodUsuario
ååO Y
==
ååZ \
codeUser
åå] e
)
ååe f
on
çç !
eu
çç" $
.
çç$ %
EquipoId
çç% -
equals
çç. 4
v
çç5 6
.
çç6 7
EquipoId
çç7 ?
into
éé 
vl
éé  
from
èè 
vlj
èè !
in
èè" $
vl
èè% '
.
èè' (
DefaultIfEmpty
èè( 6
(
èè6 7
)
èè7 8
where
êê 
e
êê  
.
êê  !

CampaniaId
êê! +
==
êê, .
activeCampaign
êê/ =
.
êê= >
Value
êê> C
&&
êêD F
t
ëë  
.
ëë  !

Secuencial
ëë! +
==
ëë, .
(
ëë/ 0
int
ëë0 3
)
ëë3 4
Enums
ëë4 9
.
ëë9 :
TiposUrl
ëë: B
.
ëëB C
VideoHistoria
ëëC P
&&
ëëQ S
e
ëëT U
.
ëëU V
Activo
ëëV \
&&
ëë] _
!
ëë` a
e
ëëa b
.
ëëb c
	Eliminado
ëëc l
&&
íí !
e
íí" #
.
íí# $
EquipoId
íí$ ,
==
íí- /
teamId
íí0 6
select
ìì 
new
ìì "
DetailByTeam
ìì# /
(
ìì/ 0
)
ìì0 1
{
îî 
TeamId
ïï #
=
ïï$ %
e
ïï& '
.
ïï' (
EquipoId
ïï( 0
,
ïï0 1
Name
ññ !
=
ññ" #
e
ññ$ %
.
ññ% &
Nombre
ññ& ,
,
ññ, -
Protagonists
óó )
=
óó* +
e
óó, -
.
óó- .
Protagonistas
óó. ;
,
óó; <
Synopsis
òò %
=
òò& '
e
òò( )
.
òò) *
Sinopsis
òò* 2
,
òò2 3
ValueUrl
ôô %
=
ôô& '
eu
ôô( *
.
ôô* +
ValorUrl
ôô+ 3
,
ôô3 4
Vote
öö !
=
öö" #
vlj
öö$ '
.
öö' (
Valor
öö( -
,
öö- .

VotationId
õõ '
=
õõ( )
vlj
õõ* -
.
õõ- .

VotacionId
õõ. 8
}
ùù 
)
ùù 
;
ùù 
var
ûû 
lstTeamDetail
ûû 
=
ûû 
query
ûû  %
.
ûû% &
ToList
ûû& ,
(
ûû, -
)
ûû- .
;
ûû. /
return
†† 
lstTeamDetail
††  
;
††  !
}
°° 	
public
££ 
Votation
££ 
InsertVotation
££ &
(
££& '
InsertVotation
££' 5
insertVotation
££6 D
)
££D E
{
§§ 	
Votacion
•• 
objVotacion
••  
=
••! "
new
••# &
Votacion
••' /
(
••/ 0
)
••0 1
{
••2 3
EquipoId
¶¶ 
=
¶¶ 
insertVotation
¶¶ )
.
¶¶) *
TeamId
¶¶* 0
,
¶¶0 1

CodUsuario
ßß 
=
ßß 
insertVotation
ßß +
.
ßß+ ,
UserCode
ßß, 4
,
ßß4 5
Valor
®® 
=
®® 
insertVotation
®® &
.
®®& '
Value
®®' ,
,
®®, -
FechaCreacion
©© 
=
©© 
DateTime
©©  (
.
©©( )
Now
©©) ,
,
©©, -
UsuarioCreacion
™™ 
=
™™  !
insertVotation
™™" 0
.
™™0 1
UserCode
™™1 9
}
´´ 
;
´´ 
EntityEntry
≠≠ 
<
≠≠ 
Votacion
≠≠  
>
≠≠  !
votacionResult
≠≠" 0
=
≠≠1 2
_unitOfWork
≠≠3 >
.
≠≠> ?
	DbContext
≠≠? H
.
≠≠H I
Votacion
≠≠I Q
.
≠≠Q R
Add
≠≠R U
(
≠≠U V
objVotacion
≠≠V a
)
≠≠a b
;
≠≠b c
_unitOfWork
ØØ 
.
ØØ 
SaveChanges
ØØ #
(
ØØ# $
)
ØØ$ %
;
ØØ% &
var
±± 
votation
±± 
=
±± 
votacionResult
±± )
.
±±) *
Entity
±±* 0
;
±±0 1
Votation
≥≥ 
objVotation
≥≥  
=
≥≥! "
new
≥≥# &
Votation
≥≥' /
(
≥≥/ 0
)
≥≥0 1
{
¥¥ 

VotationId
µµ 
=
µµ 
votation
µµ %
.
µµ% &

VotacionId
µµ& 0
,
µµ0 1
TeamId
∂∂ 
=
∂∂ 
votation
∂∂ !
.
∂∂! "
EquipoId
∂∂" *
,
∂∂* +
UserCode
∑∑ 
=
∑∑ 
votation
∑∑ #
.
∑∑# $

CodUsuario
∑∑$ .
,
∑∑. /
Value
∏∏ 
=
∏∏ 
votation
∏∏  
.
∏∏  !
Valor
∏∏! &
,
∏∏& '
CreatedUser
ππ 
=
ππ 
votation
ππ &
.
ππ& '
UsuarioCreacion
ππ' 6
,
ππ6 7
CreatedDate
∫∫ 
=
∫∫ 
votation
∫∫ &
.
∫∫& '
FechaCreacion
∫∫' 4
}
ªª 
;
ªª 
return
ΩΩ 
objVotation
ΩΩ 
;
ΩΩ 
}
øø 	
public
¡¡ 
Votation
¡¡ 
UpdateVotation
¡¡ &
(
¡¡& '
UpdateVotation
¡¡' 5
updateVotation
¡¡6 D
)
¡¡D E
{
¬¬ 	
Votacion
√√ 
objVotacion
√√  
=
√√! "
new
√√# &
Votacion
√√' /
(
√√/ 0
)
√√0 1
{
ƒƒ 

VotacionId
≈≈ 
=
≈≈ 
updateVotation
≈≈ +
.
≈≈+ ,

VotationId
≈≈, 6
,
≈≈6 7
EquipoId
∆∆ 
=
∆∆ 
updateVotation
∆∆ )
.
∆∆) *
TeamId
∆∆* 0
,
∆∆0 1

CodUsuario
«« 
=
«« 
updateVotation
«« +
.
««+ ,
UserCode
««, 4
,
««4 5
Valor
»» 
=
»» 
updateVotation
»» &
.
»»& '
Value
»»' ,
}
…… 
;
…… 
EntityEntry
ÀÀ 
<
ÀÀ 
Votacion
ÀÀ  
>
ÀÀ  !
votacionResult
ÀÀ" 0
=
ÀÀ1 2
_unitOfWork
ÀÀ3 >
.
ÀÀ> ?
	DbContext
ÀÀ? H
.
ÀÀH I
Votacion
ÀÀI Q
.
ÀÀQ R
Update
ÀÀR X
(
ÀÀX Y
objVotacion
ÀÀY d
)
ÀÀd e
;
ÀÀe f
_unitOfWork
ÕÕ 
.
ÕÕ 
SaveChanges
ÕÕ #
(
ÕÕ# $
)
ÕÕ$ %
;
ÕÕ% &
var
œœ 
votation
œœ 
=
œœ 
votacionResult
œœ )
.
œœ) *
Entity
œœ* 0
;
œœ0 1
Votation
—— 
objVotation
——  
=
——! "
new
——# &
Votation
——' /
(
——/ 0
)
——0 1
{
““ 

VotationId
”” 
=
”” 
votation
”” %
.
””% &

VotacionId
””& 0
,
””0 1
TeamId
‘‘ 
=
‘‘ 
votation
‘‘ !
.
‘‘! "
EquipoId
‘‘" *
,
‘‘* +
UserCode
’’ 
=
’’ 
votation
’’ #
.
’’# $

CodUsuario
’’$ .
,
’’. /
Value
÷÷ 
=
÷÷ 
votation
÷÷  
.
÷÷  !
Valor
÷÷! &
,
÷÷& '
LastModifiedUser
◊◊  
=
◊◊! "
votation
◊◊# +
.
◊◊+ ,!
UsuarioModificacion
◊◊, ?
,
◊◊? @
LastModifiedDate
ÿÿ  
=
ÿÿ! "
votation
ÿÿ# +
.
ÿÿ+ ,
FechaModificacion
ÿÿ, =
}
ŸŸ 
;
ŸŸ 
return
€€ 
objVotation
€€ 
;
€€ 
}
›› 	
public
ﬂﬂ 
ICollection
ﬂﬂ 
<
ﬂﬂ 
Suggestions
ﬂﬂ &
>
ﬂﬂ& '$
ListSuggestionsForUser
ﬂﬂ( >
(
ﬂﬂ> ?
string
ﬂﬂ? E
codeUser
ﬂﬂF N
)
ﬂﬂN O
{
‡‡ 	
int
·· 
?
·· 
activeCampaign
·· 
=
··  !
this
··" &
.
··& '
GetActiveCampaign
··' 8
(
··8 9
)
··9 :
;
··: ;
var
„„ 
query
„„ 
=
„„ 
(
„„ 
from
„„ 
e
„„ 
in
„„  "
_unitOfWork
„„# .
.
„„. /
	DbContext
„„/ 8
.
„„8 9
Equipo
„„9 ?
join
‰‰ 
eu
‰‰  
in
‰‰! #
_unitOfWork
‰‰$ /
.
‰‰/ 0
	DbContext
‰‰0 9
.
‰‰9 :
	EquipoUrl
‰‰: C
on
‰‰D F
e
‰‰G H
.
‰‰H I
EquipoId
‰‰I Q
equals
‰‰R X
eu
‰‰Y [
.
‰‰[ \
EquipoId
‰‰\ d
join
ÂÂ 
v
ÂÂ 
in
ÂÂ  "
_unitOfWork
ÂÂ# .
.
ÂÂ. /
	DbContext
ÂÂ/ 8
.
ÂÂ8 9
Votacion
ÂÂ9 A
on
ÊÊ !
eu
ÊÊ" $
.
ÊÊ$ %
EquipoId
ÊÊ% -
equals
ÊÊ. 4
v
ÊÊ5 6
.
ÊÊ6 7
EquipoId
ÊÊ7 ?
into
ÁÁ 
vl
ÁÁ  
from
ËË 
vlj
ËË !
in
ËË" $
vl
ËË% '
.
ËË' (
DefaultIfEmpty
ËË( 6
(
ËË6 7
)
ËË7 8
where
ÈÈ 
e
ÈÈ  
.
ÈÈ  !

CampaniaId
ÈÈ! +
==
ÈÈ, .
activeCampaign
ÈÈ/ =
.
ÈÈ= >
Value
ÈÈ> C
&&
ÈÈD F
eu
ÍÍ 
.
ÍÍ 
	TipoUrlId
ÍÍ %
==
ÍÍ& (
$num
ÍÍ) +
&&
ÍÍ, .
e
ÍÍ/ 0
.
ÍÍ0 1
Activo
ÍÍ1 7
&&
ÍÍ8 :
!
ÍÍ; <
e
ÍÍ< =
.
ÍÍ= >
	Eliminado
ÍÍ> G
&&
ÍÍH J
vlj
ÍÍK N
.
ÍÍN O

CodUsuario
ÍÍO Y
!=
ÍÍZ \
codeUser
ÍÍ] e
select
ÎÎ 
new
ÎÎ  #
Suggestions
ÎÎ$ /
(
ÎÎ/ 0
)
ÎÎ0 1
{
ÏÏ 
TeamId
ÌÌ #
=
ÌÌ$ %
e
ÌÌ& '
.
ÌÌ' (
EquipoId
ÌÌ( 0
,
ÌÌ0 1
Name
ÓÓ !
=
ÓÓ" #
e
ÓÓ$ %
.
ÓÓ% &
Nombre
ÓÓ& ,
,
ÓÓ, -
Description
ÔÔ (
=
ÔÔ) *
e
ÔÔ+ ,
.
ÔÔ, -
Descripcion
ÔÔ- 8
,
ÔÔ8 9
ValueUrl
 %
=
& '
eu
( *
.
* +
ValorUrl
+ 3
}
ÒÒ 
)
ÒÒ 
;
ÒÒ 
var
ÛÛ 
lstSuggestions
ÛÛ 
=
ÛÛ  
query
ÛÛ! &
.
ÛÛ& '
Distinct
ÛÛ' /
(
ÛÛ/ 0
)
ÛÛ0 1
.
ÛÛ1 2
OrderBy
ÛÛ2 9
(
ÛÛ9 :
x
ÛÛ: ;
=>
ÛÛ< >
Guid
ÛÛ? C
.
ÛÛC D
NewGuid
ÛÛD K
(
ÛÛK L
)
ÛÛL M
)
ÛÛM N
.
ÛÛN O
Take
ÛÛO S
(
ÛÛS T
$num
ÛÛT U
)
ÛÛU V
.
ÛÛV W
ToList
ÛÛW ]
(
ÛÛ] ^
)
ÛÛ^ _
;
ÛÛ_ `
return
ıı 
lstSuggestions
ıı !
;
ıı! "
}
ˆˆ 	
public
¯¯ 
bool
¯¯ 
ImportCampaign
¯¯ "
(
¯¯" #
	IFormFile
¯¯# ,
file
¯¯- 1
,
¯¯1 2
string
¯¯3 9
userName
¯¯: B
)
¯¯B C
{
˘˘ 	
var
˙˙ 

importFile
˙˙ 
=
˙˙ 
new
˙˙  #
ImportCampaignRequest
˙˙! 6
(
˙˙6 7
)
˙˙7 8
{
˚˚ 
file
¸¸ 
=
¸¸ 
file
¸¸ 
}
˝˝ 
;
˝˝ $
ImportCampaignResponse
ˇˇ "$
importCampaignResponse
ˇˇ# 9
=
ˇˇ: ;
_closedXMLAgent
ˇˇ< K
.
ˇˇK L
ImportCampaign
ˇˇL Z
(
ˇˇZ [

importFile
ˇˇ[ e
,
ˇˇe f
userName
ˇˇg o
)
ˇˇo p
;
ˇˇp q$
importCampaignResponse
ÅÅ "
.
ÅÅ" #
CampaignUrls
ÅÅ# /
.
ÅÅ/ 0
ForEach
ÅÅ0 7
(
ÅÅ7 8
x
ÅÅ8 9
=>
ÅÅ: <
{
ÅÅ= >
x
ÇÇ 
.
ÇÇ 
	TipoUrlId
ÇÇ 
=
ÇÇ 
_unitOfWork
ÇÇ (
.
ÇÇ( )
	DbContext
ÇÇ) 2
.
ÇÇ2 3
TipoUrl
ÇÇ3 :
.
ÇÇ: ;
Where
ÇÇ; @
(
ÇÇ@ A
t
ÇÇA B
=>
ÇÇC E
t
ÇÇF G
.
ÇÇG H

Secuencial
ÇÇH R
==
ÇÇS U
x
ÇÇV W
.
ÇÇW X
	TipoUrlId
ÇÇX a
)
ÇÇa b
.
ÇÇb c
FirstOrDefault
ÇÇc q
(
ÇÇq r
)
ÇÇr s
.
ÇÇs t
	TipoUrlId
ÇÇt }
;
ÇÇ} ~
}
ÉÉ 
)
ÉÉ 
;
ÉÉ 
UploadCampaign
ÖÖ 
uucp
ÖÖ 
=
ÖÖ  !
new
ÖÖ" %
UploadCampaign
ÖÖ& 4
(
ÖÖ4 5
)
ÖÖ5 6
{
ÜÜ 
DataCampania
áá 
=
áá $
importCampaignResponse
áá 5
.
áá5 6
	Campaigns
áá6 ?
.
áá? @
ToTable
áá@ G
(
ááG H
)
ááH I
,
ááI J
DataCampaniaUrls
àà  
=
àà! "$
importCampaignResponse
àà# 9
.
àà9 :
CampaignUrls
àà: F
.
ààF G
ToTable
ààG N
(
ààN O
)
ààO P
}
ââ 
;
ââ 
_unitOfWork
ãã 
.
ãã  
ExecuteSqlNonQuery
ãã *
(
ãã* +
$str
ãã+ C
,
ããC D
uucp
ããE I
)
ããI J
;
ããJ K
return
åå 
true
åå 
;
åå 
}
éé 	
public
êê 
bool
êê 
ImportTeams
êê 
(
êê  
	IFormFile
êê  )
file
êê* .
,
êê. /
string
êê0 6
userName
êê7 ?
)
êê? @
{
ëë 	
var
íí 

importFile
íí 
=
íí 
new
íí  
ImportTeamRequest
íí! 2
(
íí2 3
)
íí3 4
{
ìì 
file
îî 
=
îî 
file
îî 
}
ïï 
;
ïï  
ImportTeamResponse
óó  
importTeamResponse
óó 1
=
óó2 3
_closedXMLAgent
óó4 C
.
óóC D

ImportTeam
óóD N
(
óóN O

importFile
óóO Y
,
óóY Z
userName
óó[ c
)
óóc d
;
óód e 
importTeamResponse
ôô 
.
ôô 
TeamUrls
ôô '
.
ôô' (
ForEach
ôô( /
(
ôô/ 0
x
ôô0 1
=>
ôô2 4
{
ôô5 6
x
öö 
.
öö 
	TipoUrlId
öö 
=
öö 
_unitOfWork
öö )
.
öö) *
	DbContext
öö* 3
.
öö3 4
TipoUrl
öö4 ;
.
öö; <
Where
öö< A
(
ööA B
t
ööB C
=>
ööD F
t
ööG H
.
ööH I

Secuencial
ööI S
==
ööT V
x
ööW X
.
ööX Y
	TipoUrlId
ööY b
)
ööb c
.
ööc d
FirstOrDefault
ööd r
(
öör s
)
öös t
.
ööt u
	TipoUrlId
ööu ~
;
öö~ 
}
õõ 
)
õõ 
;
õõ 

UploadTeam
ùù 
uut
ùù 
=
ùù 
new
ùù  

UploadTeam
ùù! +
(
ùù+ ,
)
ùù, -
{
ûû 

DataEquipo
üü 
=
üü  
importTeamResponse
üü /
.
üü/ 0
Teams
üü0 5
.
üü5 6
ToTable
üü6 =
(
üü= >
)
üü> ?
,
üü? @
DataEquiposUrls
†† 
=
††  ! 
importTeamResponse
††" 4
.
††4 5
TeamUrls
††5 =
.
††= >
ToTable
††> E
(
††E F
)
††F G
}
°° 
;
°° 
_unitOfWork
££ 
.
££  
ExecuteSqlNonQuery
££ *
(
££* +
$str
££+ @
,
££@ A
uut
££B E
)
££E F
;
££F G
return
§§ 
true
§§ 
;
§§ 
}
¶¶ 	
public
®® 

CustomFile
®® 
RankingReport
®® '
(
®®' (
string
®®( .
templateRoot
®®/ ;
)
®®; <
{
®®= >
var
™™ 
lstRankingReport
™™  
=
™™! "
_unitOfWork
™™# .
.
™™. /
ExecuteSqlQuery
™™/ >
<
™™> ?
RankingReport
™™? L
>
™™L M
(
™™M N
$str
™™N b
,
™™b c
null
™™d h
)
™™h i
;
™™i j(
ExportRankingReportRequest
¨¨ &(
exportRankingReportRequest
¨¨' A
=
¨¨B C
new
¨¨D G(
ExportRankingReportRequest
¨¨H b
(
¨¨b c
)
¨¨c d
{
≠≠ 
rankingReports
ÆÆ 
=
ÆÆ  
lstRankingReport
ÆÆ! 1
.
ÆÆ1 2
ToList
ÆÆ2 8
(
ÆÆ8 9
)
ÆÆ9 :
}
ØØ 
;
ØØ 
var
±± #
exportRankingResponse
±± %
=
±±& '
_closedXMLAgent
±±( 7
.
±±7 8!
ExportRankingReport
±±8 K
(
±±K L(
exportRankingReportRequest
±±L f
,
±±f g
templateRoot
±±h t
)
±±t u
;
±±u v
return
≥≥ #
exportRankingResponse
≥≥ (
.
≥≥( )
	ExcelFile
≥≥) 2
;
≥≥2 3
}
µµ 	
}
∂∂ 
}∑∑ ì
ÉC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\AwardModule\Service\IAwardAppService.cs
	namespace		 	
Belcorp		
 
.		 
Premios		 
.		 
Application		 %
.		% &
Context		& -
.		- .
AwardModule		. 9
.		9 :
Service		: A
{

 
public 

	interface 
IAwardAppService %
{ 
ICollection 
< 
CampaignUrl 
>  !
ListBannersByCampaign! 6
(6 7
)7 8
;8 9
ICollection 
< 
Tiles 
> 
	ListTiles $
($ %
)% &
;& '
ICollection 
< 
DetailByTeam  
>  !
ListDetailByTeam" 2
(2 3
int3 6
teamId7 =
,= >
string? E
codeUserF N
)N O
;O P
Votation 
InsertVotation 
(  
InsertVotation  .
insertVotation/ =
)= >
;> ?
Votation 
UpdateVotation 
(  
UpdateVotation  .
updateVotation/ =
)= >
;> ?
ICollection 
< 
Suggestions 
>  "
ListSuggestionsForUser! 7
(7 8
string8 >
codeUser? G
)G H
;H I
bool 
ImportCampaign 
( 
	IFormFile %
file& *
,* +
string, 2
userName3 ;
); <
;< =
bool 
ImportTeams 
( 
	IFormFile "
file# '
,' (
string) /
userName0 8
)8 9
;9 :

CustomFile 
RankingReport  
(  !
string! '
templateRoot( 4
)4 5
;5 6
} 
} °'
ãC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\MaintenanceModule\Service\CampaignAppService.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Application %
.% &
Context& -
.- .
MaintenanceModule. ?
.? @
Service@ G
{ 
public 

class 
CampaignAppService #
:$ %
ICampaignAppService& 9
{ 
private 
readonly 
IUnitOfWork $
<$ %
PremiosContext% 3
>3 4
_unitOfWork5 @
;@ A
private 
readonly 
ICampaignAdapter )
_campaignAdapter* :
;: ;
public 
CampaignAppService !
(! "
IUnitOfWork 
< 
PremiosContext &
>& '

unitOfWork( 2
,2 3
ICampaignAdapter 
campaignAdapter ,
), -
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_campaignAdapter 
= 
campaignAdapter .
;. /
} 	
public 
bool  
ChangeStatusCampaign (
(( )
Campaign) 1
campaign2 :
): ;
{ 	
throw 
new #
NotImplementedException -
(- .
). /
;/ 0
} 	
public!! 
Campaign!! 
InsertCampaign!! &
(!!& '
Campaign!!' /
campaign!!0 8
)!!8 9
{"" 	
Campania## 
campania## 
=## 
_campaignAdapter##  0
.##0 1"
FromCampaignToCampania##1 G
(##G H
campaign##H P
)##P Q
;##Q R
_unitOfWork$$ 
.$$ 
	DbContext$$ !
.$$! "
Campania$$" *
.$$* +
Add$$+ .
($$. /
campania$$/ 7
)$$7 8
;$$8 9
_unitOfWork%% 
.%% 
SaveChanges%% #
(%%# $
)%%$ %
;%%% &
return&& 
_campaignAdapter&& #
.&&# $"
FromCampaniaToCampaign&&$ :
(&&: ;
campania&&; C
)&&C D
;&&D E
}'' 	
public)) 
List)) 
<)) 
Campaign)) 
>)) 
ListCampaign)) *
())* +
)))+ ,
{** 	
throw++ 
new++ #
NotImplementedException++ -
(++- .
)++. /
;++/ 0
},, 	
public.. 

IPagedList.. 
<.. 
Campaign.. "
>.." #
ListCampaignByPage..$ 6
(..6 7-
!ListCampaignByPageFilterParameter..7 X-
!listCampaignByPageFilterParameter..Y z
,..z {
PagedParameter	..| ä
pagedParameter
..ã ô
)
..ô ö
{// 	
var00 
query00 
=00 
from00 
p00 
in00 !
_unitOfWork00" -
.00- .
	DbContext00. 7
.007 8
Campania008 @
where11 
!11 
p11  
.11  !
	Eliminado11! *
orderby22 
p22  !
.22! "
Descripcion22" -
	ascending22. 7
select33 
new33 "
Campaign33# +
(33+ ,
)33, -
{44 

CampaignId55 &
=55' (
p55) *
.55* +

CampaniaId55+ 5
,555 6
Active66 "
=66# $
p66% &
.66& '
Activo66' -
,66- .
Description77 '
=77( )
p77* +
.77+ ,
Descripcion77, 7
}88 
;88 
if:: 
(:: -
!listCampaignByPageFilterParameter:: 1
!=::2 4
null::5 9
&&;; 
!;; 
string;; 
.;; 
IsNullOrEmpty;; (
(;;( )-
!listCampaignByPageFilterParameter;;) J
.;;J K
Description;;K V
);;V W
);;W X
{<< 
query== 
=== 
query== 
.== 
Where== #
(==# $
w==$ %
=>==& (
w==) *
.==* +
Description==+ 6
.==6 7
Contains==7 ?
(==? @-
!listCampaignByPageFilterParameter==@ a
.==a b
Description==b m
)==m n
)==n o
;==o p
}>> 
var@@ 
pagelist@@ 
=@@ 
query@@  
.@@  !
ToPagedList@@! ,
(@@, -
pagedParameter@@- ;
.@@; <
	PageIndex@@< E
,@@E F
pagedParameter@@G U
.@@U V
PageSize@@V ^
)@@^ _
;@@_ `
returnBB 
pagelistBB 
;BB 
}CC 	
}EE 
}FF È	
åC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\MaintenanceModule\Service\ICampaignAppService.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Application %
.% &
Context& -
.- .
MaintenanceModule. ?
.? @
Service@ G
{		 
public

 

	interface

 
ICampaignAppService

 (
{ 
Campaign 
InsertCampaign 
(  
Campaign  (
campaign) 1
)1 2
;2 3
bool  
ChangeStatusCampaign !
(! "
Campaign" *
campaign+ 3
)3 4
;4 5

IPagedList 
< 
Campaign 
> 
ListCampaignByPage /
(/ 0-
!ListCampaignByPageFilterParameter0 Q-
!listCampaignByPageFilterParameterR s
,s t
PagedParameter	u É
pagedParameter
Ñ í
)
í ì
;
ì î
List 
< 
Campaign 
> 
ListCampaign #
(# $
)$ %
;% &
} 
} ò
ÖC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\UserModule\Service\IUserExternalModule.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Application %
.% &
Context& -
.- .

UserModule. 8
.8 9
Service9 @
{ 
public 

	interface 
IUserExternalModule (
{		 
bool

 
UploadUserExternal

 
(

  
string

  &
dataExternal

' 3
,

3 4
bool

5 9
eliminaAnterior

: I
,

I J
string

K Q
usuario

R Y
,

Y Z
ref

[ ^
string

_ e
mensaje

f m
)

m n
;

n o
bool 
ChangePassword 
( 
string "
nroDocumento# /
,/ 0
string1 7
claveActual8 C
,C D
stringE K

claveNuevaL V
,V W
refX [
string\ b
mensajec j
)j k
;k l
bool 
ChangePasswordAdmin  
(  !
string! '
nroDocumento( 4
,4 5
string6 <

claveNueva= G
,G H
refI L
stringM S
mensajeT [
)[ \
;\ ]
} 
} ±E
ÑC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\UserModule\Service\UserExternalModule.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Application %
.% &
Context& -
.- .

UserModule. 8
.8 9
Service9 @
{ 
public 

class 
UserExternalModule #
:$ %
IUserExternalModule& 9
{ 
private 
readonly 
IUnitOfWork $
<$ %
PremiosContext% 3
>3 4
_unitOfWork5 @
;@ A
public 
UserExternalModule !
(! "
IUnitOfWork" -
<- .
PremiosContext. <
>< =

unitOfWork> H
)H I
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
} 	
public 
bool 
ChangePassword "
(" #
string# )
nroDocumento* 6
,6 7
string8 >
claveActual? J
,J K
stringL R

claveNuevaS ]
,] ^
ref_ b
stringc i
mensajej q
)q r
{ 	
bool 
response 
= 
false !
;! "
UsuarioExterno 
ue 
= 
_unitOfWork  +
.+ ,
	DbContext, 5
.5 6
UsuarioExterno6 D
.D E
FirstOrDefaultE S
(S T
tT U
=>V X
tY Z
.Z [
NroDocumento[ g
==h j
nroDocumentok w
)w x
;x y
if 
( 
ue 
== 
null 
|| 
ue  
.  !
UsuarioExternoId! 1
<=2 4
$num5 6
)6 7
{ 
mensaje   
=   
$str   5
;  5 6
return!! 
response!! 
;!!  
}"" 
if## 
(## 
EncryptHelper## 
.## 
Decrypt## %
(##% &
ue##& (
.##( )
Clave##) .
)##. /
!=##0 2
claveActual##3 >
)##> ?
{$$ 
mensaje%% 
=%% 
$str%% 0
;%%0 1
return&& 
response&& 
;&&  
}'' 
ue)) 
.)) 
Clave)) 
=)) 
EncryptHelper)) $
.))$ %
EncryptToByte))% 2
())2 3

claveNueva))3 =
)))= >
;))> ?
_unitOfWork** 
.** 
	DbContext** !
.**! "
SaveChanges**" -
(**- .
)**. /
;**/ 0
return-- 
true-- 
;-- 
}.. 	
public00 
bool00 
ChangePasswordAdmin00 '
(00' (
string00( .
nroDocumento00/ ;
,00; <
string00= C

claveNueva00D N
,00N O
ref00P S
string00T Z
mensaje00[ b
)00b c
{11 	
bool22 
response22 
=22 
false22 !
;22! "
UsuarioExterno44 
ue44 
=44 
_unitOfWork44  +
.44+ ,
	DbContext44, 5
.445 6
UsuarioExterno446 D
.44D E
FirstOrDefault44E S
(44S T
t44T U
=>44V X
t44Y Z
.44Z [
NroDocumento44[ g
==44h j
nroDocumento44k w
)44w x
;44x y
if55 
(55 
ue55 
==55 
null55 
||55 
ue55  
.55  !
UsuarioExternoId55! 1
<=552 4
$num555 6
)556 7
{66 
mensaje77 
=77 
$str77 5
;775 6
return88 
response88 
;88  
}99 
ue;; 
.;; 
Clave;; 
=;; 
EncryptHelper;; $
.;;$ %
EncryptToByte;;% 2
(;;2 3

claveNueva;;3 =
);;= >
;;;> ?
_unitOfWork<< 
.<< 
	DbContext<< !
.<<! "
SaveChanges<<" -
(<<- .
)<<. /
;<</ 0
return>> 
true>> 
;>> 
}?? 	
publicAA 
boolAA 
UploadUserExternalAA &
(AA& '
stringAA' -
dataExternalAA. :
,AA: ;
boolAA< @
eliminaAnteriorAAA P
,AAP Q
stringAAR X
usuarioAAY `
,AA` a
refAAb e
stringAAf l
mensajeAAm t
)AAt u
{BB 	
boolCC 
responseCC 
=CC 
falseCC !
;CC! "
ListDD 
<DD 
stringDD 
>DD 
dataDD 
=DD 
dataExternalDD  ,
.DD, -
SplitDD- 2
(DD2 3
newEE 
[EE 
]EE 
{EE 
$strEE 
,EE 
$strEE  $
,EE$ %
$strEE& *
}EE+ ,
,EE, -
StringSplitOptionsFF "
.FF" #
NoneFF# '
)FF' (
.FF( )
ToListFF) /
(FF/ 0
)FF0 1
;FF1 2
ifHH 
(HH 
dataHH 
.HH 
AnyHH 
(HH 
)HH 
)HH 
{II 
mensajeJJ 
=JJ 
$strJJ 6
;JJ6 7
returnKK 
responseKK 
;KK  
}LL 
varNN 
bugsNN 
=NN 
(NN 
fromNN 
xNN 
inNN !
dataNN" &
whereOO 
xOO 
.OO 
SplitOO $
(OO$ %
$strOO% (
)OO( )
.OO) *
LengthOO* 0
!=OO1 3
$numOO4 5
selectPP 
xPP 
)PP  
.PP  !
ToListPP! '
(PP' (
)PP( )
;PP) *
ifRR 
(RR 
bugsRR 
!=RR 
nullRR 
&&RR 
bugsRR  $
.RR$ %
AnyRR% (
(RR( )
)RR) *
)RR* +
{SS 
mensajeTT 
=TT 
$strTT @
;TT@ A
returnUU 
responseUU 
;UU  
}VV 
ListXX 
<XX 
UploadUserExternalXX $
>XX$ %
uploadUserExternalXX& 8
=XX9 :
dataXX; ?
.XX? @
SelectXX@ F
(XXF G
(XXG H
bXXH I
,XXI J
indexXXK P
)XXP Q
=>XXR T
newXXU X
UploadUserExternalXXY k
{YY 
IdTrabajadorZZ 
=ZZ 
indexZZ $
+ZZ% &
$numZZ' (
,ZZ( )
NombreCompleto[[ 
=[[  
b[[! "
.[[" #
Split[[# (
([[( )
$str[[) ,
)[[, -
[[[- .
$num[[. /
][[/ 0
,[[0 1
NroDocumento\\ 
=\\ 
b\\  
.\\  !
Split\\! &
(\\& '
$str\\' *
)\\* +
[\\+ ,
$num\\, -
]\\- .
,\\. /
Clave]] 
=]] 
EncryptHelper]] %
.]]% &
EncryptToByte]]& 3
(]]3 4
b]]4 5
.]]5 6
Split]]6 ;
(]]; <
$str]]< ?
)]]? @
[]]@ A
$num]]A B
]]]B C
.]]C D
ToString]]D L
(]]L M
)]]M N
)]]N O
}^^ 
)^^ 
.^^ 
ToList^^ 
(^^ 
)^^ 
;^^ 
	DataTable``  
dtuploadUserExternal`` *
=``+ ,
uploadUserExternal``- ?
.``? @
ToTable``@ G
(``G H
)``H I
;``I J'
UploadUserExternalParameterbb '
uuepbb( ,
=bb- .
newbb/ 2'
UploadUserExternalParameterbb3 N
(bbN O
)bbO P
{cc 
EliminaDatoAnteriordd #
=dd$ %
eliminaAnteriordd& 5
,dd5 6
FechaProcesoee 
=ee 
DateTimeee '
.ee' (
Nowee( +
,ee+ ,
DataUsuarioExternoff "
=ff# $ 
dtuploadUserExternalff% 9
,ff9 :
UsuarioProcesogg 
=gg  
usuariogg! (
}hh 
;hh 
_unitOfWorkjj 
.jj 
ExecuteSqlNonQueryjj *
(jj* +
$strjj+ D
,jjD E
uuepjjF J
)jjJ K
;jjK L
returnkk 
truekk 
;kk 
}ll 	
}mm 
}nn 