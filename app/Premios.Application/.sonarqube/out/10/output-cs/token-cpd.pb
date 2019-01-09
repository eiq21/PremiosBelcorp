�
�C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\AuthenticationModule\Service\AuthenticationAppService.cs
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
GetUserDetailParameter	u �
(
� �
)
� �
{
� �
UserName
� �
=
� �
username
� �
}
� �
)
� �
.
� �
FirstOrDefault
� �
(
� �
)
� �
;
� �
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
}== �
�C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\AuthenticationModule\Service\IAuthenticationAppService.cs
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
} �
�C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\AuthenticationModule\Specifications\IUserSpecification.cs
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
} �
�C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\AuthenticationModule\Specifications\UserSpecification.cs
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
}&& ��
�C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\AwardModule\Service\AwardAppService.cs
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
�� 
lstTiles
�� 
.
�� 
OrderBy
�� #
(
��# $
x
��$ %
=>
��& (
Guid
��) -
.
��- .
NewGuid
��. 5
(
��5 6
)
��6 7
)
��7 8
.
��8 9
ToList
��9 ?
(
��? @
)
��@ A
;
��A B
}
�� 	
public
�� 
ICollection
�� 
<
�� 
DetailByTeam
�� '
>
��' (
ListDetailByTeam
��) 9
(
��9 :
int
��: =
teamId
��> D
,
��D E
string
��F L
codeUser
��M U
)
��U V
{
�� 	
int
�� 
?
�� 
activeCampaign
�� 
=
��  !
this
��" &
.
��& '
GetActiveCampaign
��' 8
(
��8 9
)
��9 :
;
��: ;
var
�� 
query
�� 
=
�� 
(
�� 
from
�� 
e
�� 
in
��  "
_unitOfWork
��# .
.
��. /
	DbContext
��/ 8
.
��8 9
Equipo
��9 ?
join
�� 
eu
��  
in
��! #
_unitOfWork
��$ /
.
��/ 0
	DbContext
��0 9
.
��9 :
	EquipoUrl
��: C
on
��D F
e
��G H
.
��H I
EquipoId
��I Q
equals
��R X
eu
��Y [
.
��[ \
EquipoId
��\ d
join
�� 
t
�� 
in
��  "
_unitOfWork
��# .
.
��. /
	DbContext
��/ 8
.
��8 9
TipoUrl
��9 @
on
��A C
eu
��D F
.
��F G
	TipoUrlId
��G P
equals
��Q W
t
��X Y
.
��Y Z
	TipoUrlId
��Z c
join
�� 
v
�� 
in
��  "
_unitOfWork
��# .
.
��. /
	DbContext
��/ 8
.
��8 9
Votacion
��9 A
.
��A B
Where
��B G
(
��G H
x
��H I
=>
��J L
x
��M N
.
��N O

CodUsuario
��O Y
==
��Z \
codeUser
��] e
)
��e f
on
�� !
eu
��" $
.
��$ %
EquipoId
��% -
equals
��. 4
v
��5 6
.
��6 7
EquipoId
��7 ?
into
�� 
vl
��  
from
�� 
vlj
�� !
in
��" $
vl
��% '
.
��' (
DefaultIfEmpty
��( 6
(
��6 7
)
��7 8
where
�� 
e
��  
.
��  !

CampaniaId
��! +
==
��, .
activeCampaign
��/ =
.
��= >
Value
��> C
&&
��D F
t
��  
.
��  !

Secuencial
��! +
==
��, .
(
��/ 0
int
��0 3
)
��3 4
Enums
��4 9
.
��9 :
TiposUrl
��: B
.
��B C
VideoHistoria
��C P
&&
��Q S
e
��T U
.
��U V
Activo
��V \
&&
��] _
!
��` a
e
��a b
.
��b c
	Eliminado
��c l
&&
�� !
e
��" #
.
��# $
EquipoId
��$ ,
==
��- /
teamId
��0 6
select
�� 
new
�� "
DetailByTeam
��# /
(
��/ 0
)
��0 1
{
�� 
TeamId
�� #
=
��$ %
e
��& '
.
��' (
EquipoId
��( 0
,
��0 1
Name
�� !
=
��" #
e
��$ %
.
��% &
Nombre
��& ,
,
��, -
Protagonists
�� )
=
��* +
e
��, -
.
��- .
Protagonistas
��. ;
,
��; <
Synopsis
�� %
=
��& '
e
��( )
.
��) *
Sinopsis
��* 2
,
��2 3
ValueUrl
�� %
=
��& '
eu
��( *
.
��* +
ValorUrl
��+ 3
,
��3 4
Vote
�� !
=
��" #
vlj
��$ '
.
��' (
Valor
��( -
,
��- .

VotationId
�� '
=
��( )
vlj
��* -
.
��- .

VotacionId
��. 8
}
�� 
)
�� 
;
�� 
var
�� 
lstTeamDetail
�� 
=
�� 
query
��  %
.
��% &
ToList
��& ,
(
��, -
)
��- .
;
��. /
return
�� 
lstTeamDetail
��  
;
��  !
}
�� 	
public
�� 
Votation
�� 
InsertVotation
�� &
(
��& '
InsertVotation
��' 5
insertVotation
��6 D
)
��D E
{
�� 	
Votacion
�� 
objVotacion
��  
=
��! "
new
��# &
Votacion
��' /
(
��/ 0
)
��0 1
{
��2 3
EquipoId
�� 
=
�� 
insertVotation
�� )
.
��) *
TeamId
��* 0
,
��0 1

CodUsuario
�� 
=
�� 
insertVotation
�� +
.
��+ ,
UserCode
��, 4
,
��4 5
Valor
�� 
=
�� 
insertVotation
�� &
.
��& '
Value
��' ,
,
��, -
FechaCreacion
�� 
=
�� 
DateTime
��  (
.
��( )
Now
��) ,
,
��, -
UsuarioCreacion
�� 
=
��  !
insertVotation
��" 0
.
��0 1
UserCode
��1 9
}
�� 
;
�� 
EntityEntry
�� 
<
�� 
Votacion
��  
>
��  !
votacionResult
��" 0
=
��1 2
_unitOfWork
��3 >
.
��> ?
	DbContext
��? H
.
��H I
Votacion
��I Q
.
��Q R
Add
��R U
(
��U V
objVotacion
��V a
)
��a b
;
��b c
_unitOfWork
�� 
.
�� 
SaveChanges
�� #
(
��# $
)
��$ %
;
��% &
var
�� 
votation
�� 
=
�� 
votacionResult
�� )
.
��) *
Entity
��* 0
;
��0 1
Votation
�� 
objVotation
��  
=
��! "
new
��# &
Votation
��' /
(
��/ 0
)
��0 1
{
�� 

VotationId
�� 
=
�� 
votation
�� %
.
��% &

VotacionId
��& 0
,
��0 1
TeamId
�� 
=
�� 
votation
�� !
.
��! "
EquipoId
��" *
,
��* +
UserCode
�� 
=
�� 
votation
�� #
.
��# $

CodUsuario
��$ .
,
��. /
Value
�� 
=
�� 
votation
��  
.
��  !
Valor
��! &
,
��& '
CreatedUser
�� 
=
�� 
votation
�� &
.
��& '
UsuarioCreacion
��' 6
,
��6 7
CreatedDate
�� 
=
�� 
votation
�� &
.
��& '
FechaCreacion
��' 4
}
�� 
;
�� 
return
�� 
objVotation
�� 
;
�� 
}
�� 	
public
�� 
Votation
�� 
UpdateVotation
�� &
(
��& '
UpdateVotation
��' 5
updateVotation
��6 D
)
��D E
{
�� 	
Votacion
�� 
objVotacion
��  
=
��! "
new
��# &
Votacion
��' /
(
��/ 0
)
��0 1
{
�� 

VotacionId
�� 
=
�� 
updateVotation
�� +
.
��+ ,

VotationId
��, 6
,
��6 7
EquipoId
�� 
=
�� 
updateVotation
�� )
.
��) *
TeamId
��* 0
,
��0 1

CodUsuario
�� 
=
�� 
updateVotation
�� +
.
��+ ,
UserCode
��, 4
,
��4 5
Valor
�� 
=
�� 
updateVotation
�� &
.
��& '
Value
��' ,
}
�� 
;
�� 
EntityEntry
�� 
<
�� 
Votacion
��  
>
��  !
votacionResult
��" 0
=
��1 2
_unitOfWork
��3 >
.
��> ?
	DbContext
��? H
.
��H I
Votacion
��I Q
.
��Q R
Update
��R X
(
��X Y
objVotacion
��Y d
)
��d e
;
��e f
_unitOfWork
�� 
.
�� 
SaveChanges
�� #
(
��# $
)
��$ %
;
��% &
var
�� 
votation
�� 
=
�� 
votacionResult
�� )
.
��) *
Entity
��* 0
;
��0 1
Votation
�� 
objVotation
��  
=
��! "
new
��# &
Votation
��' /
(
��/ 0
)
��0 1
{
�� 

VotationId
�� 
=
�� 
votation
�� %
.
��% &

VotacionId
��& 0
,
��0 1
TeamId
�� 
=
�� 
votation
�� !
.
��! "
EquipoId
��" *
,
��* +
UserCode
�� 
=
�� 
votation
�� #
.
��# $

CodUsuario
��$ .
,
��. /
Value
�� 
=
�� 
votation
��  
.
��  !
Valor
��! &
,
��& '
LastModifiedUser
��  
=
��! "
votation
��# +
.
��+ ,!
UsuarioModificacion
��, ?
,
��? @
LastModifiedDate
��  
=
��! "
votation
��# +
.
��+ ,
FechaModificacion
��, =
}
�� 
;
�� 
return
�� 
objVotation
�� 
;
�� 
}
�� 	
public
�� 
ICollection
�� 
<
�� 
Suggestions
�� &
>
��& '$
ListSuggestionsForUser
��( >
(
��> ?
string
��? E
codeUser
��F N
)
��N O
{
�� 	
int
�� 
?
�� 
activeCampaign
�� 
=
��  !
this
��" &
.
��& '
GetActiveCampaign
��' 8
(
��8 9
)
��9 :
;
��: ;
var
�� 
query
�� 
=
�� 
(
�� 
from
�� 
e
�� 
in
��  "
_unitOfWork
��# .
.
��. /
	DbContext
��/ 8
.
��8 9
Equipo
��9 ?
join
�� 
eu
��  
in
��! #
_unitOfWork
��$ /
.
��/ 0
	DbContext
��0 9
.
��9 :
	EquipoUrl
��: C
on
��D F
e
��G H
.
��H I
EquipoId
��I Q
equals
��R X
eu
��Y [
.
��[ \
EquipoId
��\ d
join
�� 
v
�� 
in
��  "
_unitOfWork
��# .
.
��. /
	DbContext
��/ 8
.
��8 9
Votacion
��9 A
on
�� !
eu
��" $
.
��$ %
EquipoId
��% -
equals
��. 4
v
��5 6
.
��6 7
EquipoId
��7 ?
into
�� 
vl
��  
from
�� 
vlj
�� !
in
��" $
vl
��% '
.
��' (
DefaultIfEmpty
��( 6
(
��6 7
)
��7 8
where
�� 
e
��  
.
��  !

CampaniaId
��! +
==
��, .
activeCampaign
��/ =
.
��= >
Value
��> C
&&
��D F
eu
�� 
.
�� 
	TipoUrlId
�� %
==
��& (
$num
��) +
&&
��, .
e
��/ 0
.
��0 1
Activo
��1 7
&&
��8 :
!
��; <
e
��< =
.
��= >
	Eliminado
��> G
&&
��H J
vlj
��K N
.
��N O

CodUsuario
��O Y
!=
��Z \
codeUser
��] e
select
�� 
new
��  #
Suggestions
��$ /
(
��/ 0
)
��0 1
{
�� 
TeamId
�� #
=
��$ %
e
��& '
.
��' (
EquipoId
��( 0
,
��0 1
Name
�� !
=
��" #
e
��$ %
.
��% &
Nombre
��& ,
,
��, -
Description
�� (
=
��) *
e
��+ ,
.
��, -
Descripcion
��- 8
,
��8 9
ValueUrl
�� %
=
��& '
eu
��( *
.
��* +
ValorUrl
��+ 3
}
�� 
)
�� 
;
�� 
var
�� 
lstSuggestions
�� 
=
��  
query
��! &
.
��& '
Distinct
��' /
(
��/ 0
)
��0 1
.
��1 2
OrderBy
��2 9
(
��9 :
x
��: ;
=>
��< >
Guid
��? C
.
��C D
NewGuid
��D K
(
��K L
)
��L M
)
��M N
.
��N O
Take
��O S
(
��S T
$num
��T U
)
��U V
.
��V W
ToList
��W ]
(
��] ^
)
��^ _
;
��_ `
return
�� 
lstSuggestions
�� !
;
��! "
}
�� 	
public
�� 
bool
�� 
ImportCampaign
�� "
(
��" #
	IFormFile
��# ,
file
��- 1
,
��1 2
string
��3 9
userName
��: B
)
��B C
{
�� 	
var
�� 

importFile
�� 
=
�� 
new
��  #
ImportCampaignRequest
��! 6
(
��6 7
)
��7 8
{
�� 
file
�� 
=
�� 
file
�� 
}
�� 
;
�� $
ImportCampaignResponse
�� "$
importCampaignResponse
��# 9
=
��: ;
_closedXMLAgent
��< K
.
��K L
ImportCampaign
��L Z
(
��Z [

importFile
��[ e
,
��e f
userName
��g o
)
��o p
;
��p q$
importCampaignResponse
�� "
.
��" #
CampaignUrls
��# /
.
��/ 0
ForEach
��0 7
(
��7 8
x
��8 9
=>
��: <
{
��= >
x
�� 
.
�� 
	TipoUrlId
�� 
=
�� 
_unitOfWork
�� (
.
��( )
	DbContext
��) 2
.
��2 3
TipoUrl
��3 :
.
��: ;
Where
��; @
(
��@ A
t
��A B
=>
��C E
t
��F G
.
��G H

Secuencial
��H R
==
��S U
x
��V W
.
��W X
	TipoUrlId
��X a
)
��a b
.
��b c
FirstOrDefault
��c q
(
��q r
)
��r s
.
��s t
	TipoUrlId
��t }
;
��} ~
}
�� 
)
�� 
;
�� 
UploadCampaign
�� 
uucp
�� 
=
��  !
new
��" %
UploadCampaign
��& 4
(
��4 5
)
��5 6
{
�� 
DataCampania
�� 
=
�� $
importCampaignResponse
�� 5
.
��5 6
	Campaigns
��6 ?
.
��? @
ToTable
��@ G
(
��G H
)
��H I
,
��I J
DataCampaniaUrls
��  
=
��! "$
importCampaignResponse
��# 9
.
��9 :
CampaignUrls
��: F
.
��F G
ToTable
��G N
(
��N O
)
��O P
}
�� 
;
�� 
_unitOfWork
�� 
.
��  
ExecuteSqlNonQuery
�� *
(
��* +
$str
��+ C
,
��C D
uucp
��E I
)
��I J
;
��J K
return
�� 
true
�� 
;
�� 
}
�� 	
public
�� 
bool
�� 
ImportTeams
�� 
(
��  
	IFormFile
��  )
file
��* .
,
��. /
string
��0 6
userName
��7 ?
)
��? @
{
�� 	
var
�� 

importFile
�� 
=
�� 
new
��  
ImportTeamRequest
��! 2
(
��2 3
)
��3 4
{
�� 
file
�� 
=
�� 
file
�� 
}
�� 
;
��  
ImportTeamResponse
��  
importTeamResponse
�� 1
=
��2 3
_closedXMLAgent
��4 C
.
��C D

ImportTeam
��D N
(
��N O

importFile
��O Y
,
��Y Z
userName
��[ c
)
��c d
;
��d e 
importTeamResponse
�� 
.
�� 
TeamUrls
�� '
.
��' (
ForEach
��( /
(
��/ 0
x
��0 1
=>
��2 4
{
��5 6
x
�� 
.
�� 
	TipoUrlId
�� 
=
�� 
_unitOfWork
�� )
.
��) *
	DbContext
��* 3
.
��3 4
TipoUrl
��4 ;
.
��; <
Where
��< A
(
��A B
t
��B C
=>
��D F
t
��G H
.
��H I

Secuencial
��I S
==
��T V
x
��W X
.
��X Y
	TipoUrlId
��Y b
)
��b c
.
��c d
FirstOrDefault
��d r
(
��r s
)
��s t
.
��t u
	TipoUrlId
��u ~
;
��~ 
}
�� 
)
�� 
;
�� 

UploadTeam
�� 
uut
�� 
=
�� 
new
��  

UploadTeam
��! +
(
��+ ,
)
��, -
{
�� 

DataEquipo
�� 
=
��  
importTeamResponse
�� /
.
��/ 0
Teams
��0 5
.
��5 6
ToTable
��6 =
(
��= >
)
��> ?
,
��? @
DataEquiposUrls
�� 
=
��  ! 
importTeamResponse
��" 4
.
��4 5
TeamUrls
��5 =
.
��= >
ToTable
��> E
(
��E F
)
��F G
}
�� 
;
�� 
_unitOfWork
�� 
.
��  
ExecuteSqlNonQuery
�� *
(
��* +
$str
��+ @
,
��@ A
uut
��B E
)
��E F
;
��F G
return
�� 
true
�� 
;
�� 
}
�� 	
public
�� 

CustomFile
�� 
RankingReport
�� '
(
��' (
string
��( .
templateRoot
��/ ;
)
��; <
{
��= >
var
�� 
lstRankingReport
��  
=
��! "
_unitOfWork
��# .
.
��. /
ExecuteSqlQuery
��/ >
<
��> ?
RankingReport
��? L
>
��L M
(
��M N
$str
��N b
,
��b c
null
��d h
)
��h i
;
��i j(
ExportRankingReportRequest
�� &(
exportRankingReportRequest
��' A
=
��B C
new
��D G(
ExportRankingReportRequest
��H b
(
��b c
)
��c d
{
�� 
rankingReports
�� 
=
��  
lstRankingReport
��! 1
.
��1 2
ToList
��2 8
(
��8 9
)
��9 :
}
�� 
;
�� 
var
�� #
exportRankingResponse
�� %
=
��& '
_closedXMLAgent
��( 7
.
��7 8!
ExportRankingReport
��8 K
(
��K L(
exportRankingReportRequest
��L f
,
��f g
templateRoot
��h t
)
��t u
;
��u v
return
�� #
exportRankingResponse
�� (
.
��( )
	ExcelFile
��) 2
;
��2 3
}
�� 	
}
�� 
}�� �
�C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\AwardModule\Service\IAwardAppService.cs
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
} �'
�C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\MaintenanceModule\Service\CampaignAppService.cs
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
PagedParameter	..| �
pagedParameter
..� �
)
..� �
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
}FF �	
�C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\MaintenanceModule\Service\ICampaignAppService.cs
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
PagedParameter	u �
pagedParameter
� �
)
� �
;
� �
List 
< 
Campaign 
> 
ListCampaign #
(# $
)$ %
;% &
} 
} �
�C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\UserModule\Service\IUserExternalModule.cs
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
} �E
�C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Context\UserModule\Service\UserExternalModule.cs
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