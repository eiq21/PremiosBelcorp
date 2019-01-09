à?
jC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.API\Controllers\AwardController.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
API 
. 
Controllers )
{ 
[ 
	Authorize 
] 
public 

class 
AwardController  
:! "
BaseController# 1
{ 
private 
readonly 
IAwardAppService )
_awardAppService* :
;: ;
public 
IConfiguration 
_configuration ,
{- .
get/ 2
;2 3
}4 5
public 
AwardController 
( 
IAwardAppService /
awardAppService0 ?
,? @
IConfigurationA O
configurationP ]
)] ^
{ 	
_awardAppService 
= 
awardAppService .
;. /
_configuration 
= 
configuration *
;* +
} 	
[ 	

EnableCors	 
( 
$str  
)  !
]! "
[ 	
HttpPost	 
] 
public   
IActionResult   !
ListBannersByCampaign   2
(  2 3
[  3 4
FromBody  4 <
]  < =(
ListBannersByCampaignRequest  = Y(
listBannersByCampaignRequest  Z v
)  v w
{!! 	
return"" 
Ok"" 
("" 
new"" )
ListBannersByCampaignResponse"" 7
{## 
CampaignUrl$$ 
=$$ 
_awardAppService$$ .
.$$. /!
ListBannersByCampaign$$/ D
($$D E
)$$E F
}%% 
)%% 
;%% 
}&& 	
[(( 	

EnableCors((	 
((( 
$str((  
)((  !
]((! "
[)) 	
HttpPost))	 
])) 
public** 
IActionResult** 
	ListTiles** &
(**& '
)**' (
{++ 	
return,, 
Ok,, 
(,, 
new,, 
ListTilesResponse,, +
{-- 
Tiles.. 
=.. 
_awardAppService.. (
...( )
	ListTiles..) 2
(..2 3
)..3 4
}// 
)// 
;// 
}00 	
[22 	

EnableCors22	 
(22 
$str22  
)22  !
]22! "
[33 	
HttpPost33	 
]33 
public44 
IActionResult44 
ListDetailByTeam44 -
(44- .
[44. /
FromBody44/ 7
]447 8#
ListDetailByTeamRequest448 O#
listDetailByTeamRequest44P g
)44g h
{55 	
return66 
Ok66 
(66 
new66 
ListDetailResponse66 ,
{77 
Detail88 
=88 
_awardAppService88 )
.88) *
ListDetailByTeam88* :
(88: ;#
listDetailByTeamRequest88; R
.88R S
TeamId88S Y
,88Y Z#
listDetailByTeamRequest88[ r
.88r s
CodeUser88s {
)88{ |
}99 
)99 
;99 
}:: 	
[<< 	

EnableCors<<	 
(<< 
$str<<  
)<<  !
]<<! "
[== 	
HttpPost==	 
]== 
public>> 
IActionResult>> 
InsertVotation>> +
(>>+ ,
[>>, -
FromBody>>- 5
]>>5 6!
InsertVotationRequest>>6 K!
InsertVotationRequest>>L a
)>>a b
{?? 	
InsertVotationAA 
insertVotationAA )
=AA* +
newAA, /
InsertVotationAA0 >
(AA> ?
)AA? @
{AAA B
TeamIdBB 
=BB !
InsertVotationRequestBB .
.BB. /
TeamIdBB/ 5
,BB5 6
UserCodeCC 
=CC !
InsertVotationRequestCC 0
.CC0 1
UserCodeCC1 9
,CC9 :
ValueDD 
=DD !
InsertVotationRequestDD -
.DD- .
ValueDD. 3
}EE 
;EE 
returnGG 
OkGG 
(GG 
newGG "
InsertVotationResponseGG 0
{HH 
VotationII 
=II 
_awardAppServiceII +
.II+ ,
InsertVotationII, :
(II: ;
insertVotationII; I
)III J
}JJ 
)JJ 
;JJ 
}KK 	
[MM 	

EnableCorsMM	 
(MM 
$strMM  
)MM  !
]MM! "
[NN 	
HttpPostNN	 
]NN 
publicOO 
IActionResultOO 
UpdateVotationOO +
(OO+ ,
[OO, -
FromBodyOO- 5
]OO5 6!
UpdateVotationRequestOO6 K!
UpdateVotationRequestOOL a
)OOa b
{PP 	
UpdateVotationRR 
updateVotationRR )
=RR* +
newRR, /
UpdateVotationRR0 >
(RR> ?
)RR? @
{SS 
TeamIdTT 
=TT !
UpdateVotationRequestTT .
.TT. /
TeamIdTT/ 5
,TT5 6
UserCodeUU 
=UU !
UpdateVotationRequestUU 0
.UU0 1
UserCodeUU1 9
,UU9 :
ValueVV 
=VV !
UpdateVotationRequestVV -
.VV- .
ValueVV. 3
,VV3 4

VotationIdWW 
=WW !
UpdateVotationRequestWW 2
.WW2 3

VotationIdWW3 =
}XX 
;XX 
returnZZ 
OkZZ 
(ZZ 
newZZ "
UpdateVotationResponseZZ 0
{[[ 
Votation\\ 
=\\ 
_awardAppService\\ +
.\\+ ,
UpdateVotation\\, :
(\\: ;
updateVotation\\; I
)\\I J
}]] 
)]] 
;]] 
}^^ 	
[`` 	

EnableCors``	 
(`` 
$str``  
)``  !
]``! "
[aa 	
HttpPostaa	 
]aa 
publicbb 
IActionResultbb "
ListSuggestionsForUserbb 3
(bb3 4
[bb4 5
FromBodybb5 =
]bb= >!
ListSuggetionsRequestbb> S!
ListSuggetionsRequestbbT i
)bbi j
{cc 	
returndd 
Okdd 
(dd 
newdd #
ListSuggestionsResponsedd 1
{ee 
Suggestionsff 
=ff 
_awardAppServiceff .
.ff. /"
ListSuggestionsForUserff/ E
(ffE F!
ListSuggetionsRequestffF [
.ff[ \
CodeUserff\ d
)ffd e
}gg 
)gg 
;gg 
}hh 	
[jj 	

EnableCorsjj	 
(jj 
$strjj  
)jj  !
]jj! "
[kk 	
HttpPostkk	 
]kk 
publicll 
IActionResultll 
GetRankingReportll -
(ll- .
)ll. /
{mm 	
varoo 
calleroo 
=oo 
thisoo 
.oo 
Useroo "
;oo" #
ifpp 
(pp 
!pp 
callerpp 
.pp 
HasClaimpp  
(pp  !
$strpp! (
,pp( )
$strpp* 0
)pp0 1
)pp1 2
{qq 
returnrr 

BadRequestrr !
(rr! "
$strrr" R
)rrR S
;rrS T
}ss 
varuu 
templateRootuu 
=uu 
_configurationuu -
[uu- .
$struu. N
]uuN O
;uuO P
returnww 
Okww 
(ww 
newww !
ExportRankingResponseww /
{xx 
	ExcelFileyy 
=yy 
_awardAppServiceyy ,
.yy, -
RankingReportyy- :
(yy: ;
templateRootyy; G
)yyG H
}zz 
)zz 
;zz 
}{{ 	
}|| 
}}} »
iC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.API\Controllers\BaseController.cs
	namespace

 	
Belcorp


 
.

 
Premios

 
.

 
API

 
.

 
Controllers

 )
{ 
[ 
ServiceFilter 
( 
typeof 
( 
ApiExceptionFilter ,
), -
)- .
]. /
[ 
Route 

(
 
$str &
)& '
]' (
[ 

EnableCors 
( 
$str 
) 
] 
[ 
	Authorize 
] 
public 

class 
BaseController 
:  !

Controller" ,
{ 
} 
} ˘
mC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.API\Controllers\CampaignController.cs
	namespace

 	
Belcorp


 
.

 
Premios

 
.

 
API

 
.

 
Controllers

 )
{ 
public 

class 
CampaignController #
:$ %
BaseController& 4
{ 
private 
readonly 
ICampaignAppService ,
_campaigAnppService- @
;@ A
public 
CampaignController !
(! "
ICampaignAppService" 5
campaigAnppService6 H
)H I
{ 	
_campaigAnppService 
=  !
campaigAnppService" 4
;4 5
} 	
[ 	
HttpPost	 
] 
public "
InsertCampaignResponse %
InsertCampaign& 4
(4 5
[5 6
FromBody6 >
]> ?!
InsertCampaignRequest? T 
insertProcessRequestU i
)i j
{ 	
return 
new "
InsertCampaignResponse -
{ 
Campaign 
= 
_campaigAnppService .
.. /
InsertCampaign/ =
(= > 
insertProcessRequest> R
.R S
CampaignS [
)[ \
} 
; 
} 	
[   	
HttpPost  	 
]   
public!! 
IActionResult!! 
ListCampaignByPage!! /
(!!/ 0
[!!0 1
FromBody!!1 9
]!!9 :%
ListCampaignByPageRequest!!; T
ListCampaignByPage!!U g
)!!g h
{"" 	
return$$ 
Ok$$ 
($$ 
new$$ &
ListCampaignByPageResponse$$ 4
{$$5 6
	Campaigns%% 
=%% 
_campaigAnppService%% /
.%%/ 0
ListCampaignByPage%%0 B
(%%B C
ListCampaignByPage%%C U
.%%U V-
!ListCampaignByPageFilterParameter%%V w
,%%w x
ListCampaignByPage	%%y ã
.
%%ã å
PagedParameter
%%å ö
)
%%ö õ
}&& 
)&& 
;&& 
}(( 	
})) 
}** Õf
kC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.API\Controllers\UploadController.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
API 
. 
Controllers )
{ 
public 

class 
UploadController !
:" #
BaseController$ 2
{ 
private 
readonly 
IUserExternalModule ,
_userExternalModule- @
;@ A
private 
readonly 
IAwardAppService )
_awardAppService* :
;: ;
public 
IConfiguration 
_configuration ,
{- .
get/ 2
;2 3
}4 5
public 
UploadController 
(  
IUserExternalModule  3
userExternalModule4 F
,F G
IAwardAppServiceH X
awardAppServiceY h
,h i
IConfigurationj x
configuration	y Ü
)
Ü á
{ 	
this 
. 
_userExternalModule $
=% &
userExternalModule' 9
;9 :
this 
. 
_awardAppService !
=" #
awardAppService$ 3
;3 4
_configuration 
= 
configuration *
;* +
}   	
[## 	
HttpPost##	 
]## 
public$$ 
IActionResult$$ 
UploadUserExternal$$ /
($$/ 0
	IFormFile$$0 9
file$$: >
,$$> ?
bool$$@ D
removePrevious$$E S
=$$T U
false$$V [
)$$[ \
{%% 	
if&& 
(&& 
file&& 
==&& 
null&& 
||&& 
file&&  $
.&&$ %
Length&&% +
<=&&, .
$num&&/ 0
)&&0 1
{'' 
return(( 

BadRequest(( !
(((! "
$str((" <
)((< =
;((= >
})) 
if++ 
(++ 
file++ 
.++ 
ContentType++  
!=++! #
$str++$ .
)++. /
{,, 
return-- 

BadRequest-- !
(--! "
$str--" U
)--U V
;--V W
}.. 
var00 
caller00 
=00 
User00 
as00  
ClaimsPrincipal00! 0
;000 1
if11 
(11 
!11 
caller11 
.11 
HasClaim11  
(11  !
$str11! (
,11( )
$str11* 0
)110 1
)111 2
{22 
return33 

BadRequest33 !
(33! "
$str33" E
)33E F
;33F G
}44 
Stream66 
sm66 
=66 
file66 
.66 
OpenReadStream66 +
(66+ ,
)66, -
;66- .
string77 
archivo77 
=77 
$str77 
;77  
using88 
(88 
StreamReader88 
sr88  "
=88# $
new88% (
StreamReader88) 5
(885 6
sm886 8
,888 9
System88: @
.88@ A
Text88A E
.88E F
Encoding88F N
.88N O
Default88O V
,88V W
true88X \
)88\ ]
)88] ^
{99 
archivo:: 
=:: 
sr:: 
.:: 
	ReadToEnd:: &
(::& '
)::' (
;::( )
};; 
string?? 
mensaje?? 
=?? 
$str?? 
;??  
bool@@ 
resp@@ 
=@@ 
_userExternalModule@@ +
.@@+ ,
UploadUserExternal@@, >
(@@> ?
archivo@@? F
,@@F G
removePrevious@@H V
,@@V W
User@@X \
.@@\ ]
Identity@@] e
.@@e f
Name@@f j
,@@j k
ref@@l o
mensaje@@p w
)@@w x
;@@x y
returnBB 
OkBB 
(BB 
newBB 
{CC 
resultDD 
=DD 
respDD 
,DD 
mensajeEE 
}FF 
)FF 
;FF 
}GG 	
[II 	
HttpPostII	 
]II 
publicJJ 
IActionResultJJ 
UploadCampaignJJ +
(JJ+ ,
	IFormFileJJ, 5
fileJJ6 :
,JJ: ;
boolJJ< @
removePreviousJJA O
=JJP Q
falseJJR W
)JJW X
{KK 	
ifLL 
(LL 
fileLL 
==LL 
nullLL 
||LL 
fileLL  $
.LL$ %
LengthLL% +
<=LL, .
$numLL/ 0
)LL0 1
{MM 
returnNN 

BadRequestNN !
(NN! "
$strNN" <
)NN< =
;NN= >
}OO 
ifQQ 
(QQ 
fileQQ 
.QQ 
ContentTypeQQ  
!=QQ! #
$strQQ$ >
&&QQ? A
fileQQB F
.QQF G
ContentTypeQQG R
!=QQS U
$str	QQV ô
)
QQô ö
{RR 
returnSS 

BadRequestSS !
(SS! "
$strSS" O
)SSO P
;SSP Q
}TT 
varVV 
callerVV 
=VV 
UserVV 
asVV  
ClaimsPrincipalVV! 0
;VV0 1
ifXX 
(XX 
!XX 
callerXX 
.XX 
HasClaimXX  
(XX  !
$strXX! (
,XX( )
$strXX* 0
)XX0 1
)XX1 2
{YY 
returnZZ 

BadRequestZZ !
(ZZ! "
$strZZ" E
)ZZE F
;ZZF G
}[[ 
var]] 
result]] 
=]] 
_awardAppService]] )
.]]) *
ImportCampaign]]* 8
(]]8 9
file]]9 =
,]]= >
caller]]? E
.]]E F
Identity]]F N
.]]N O
Name]]O S
)]]S T
;]]T U
var__ 

fileResult__ 
=__ 
new__  
UploadFileResult__! 1
{__2 3
Status`` 
=`` 
result`` 
}aa 
;aa 
varcc 
lstFileResultcc 
=cc 
newcc  #
Listcc$ (
<cc( )
UploadFileResultcc) 9
>cc9 :
(cc: ;
)cc; <
;cc< =
lstFileResultdd 
.dd 
Adddd 
(dd 

fileResultdd (
)dd( )
;dd) *
returnff 
Okff 
(ff 
newff 
UploadFileResponseff ,
(ff, -
)ff- .
{gg 
UploadFilesResulthh !
=hh" #
lstFileResulthh$ 1
}ii 
)ii 
;ii 
}jj 	
[mm 	
HttpPostmm	 
]mm 
publicnn 
IActionResultnn 
UploadUrlsTeamnn +
(nn+ ,
	IFormFilenn, 5
filenn6 :
)nn: ;
{oo 	
ifpp 
(pp 
filepp 
==pp 
nullpp 
||pp 
filepp  $
.pp$ %
Lengthpp% +
<=pp, .
$numpp/ 0
)pp0 1
{qq 
returnrr 

BadRequestrr !
(rr! "
$strrr" <
)rr< =
;rr= >
}ss 
ifuu 
(uu 
fileuu 
.uu 
ContentTypeuu  
!=uu! #
$struu$ >
&&uu? A
fileuuB F
.uuF G
ContentTypeuuG R
!=uuS U
$str	uuV ô
)
uuô ö
{vv 
returnww 

BadRequestww !
(ww! "
$strww" O
)wwO P
;wwP Q
}xx 
varzz 
callerzz 
=zz 
Userzz 
aszz  
ClaimsPrincipalzz! 0
;zz0 1
if|| 
(|| 
!|| 
caller|| 
.|| 
HasClaim||  
(||  !
$str||! (
,||( )
$str||* 0
)||0 1
)||1 2
{}} 
return~~ 

BadRequest~~ !
(~~! "
$str~~" E
)~~E F
;~~F G
} 
var
ÅÅ 
result
ÅÅ 
=
ÅÅ 
_awardAppService
ÅÅ )
.
ÅÅ) *
ImportTeams
ÅÅ* 5
(
ÅÅ5 6
file
ÅÅ6 :
,
ÅÅ: ;
caller
ÅÅ< B
.
ÅÅB C
Identity
ÅÅC K
.
ÅÅK L
Name
ÅÅL P
)
ÅÅP Q
;
ÅÅQ R
var
ÑÑ 

fileResult
ÑÑ 
=
ÑÑ 
new
ÑÑ  
UploadFileResult
ÑÑ! 1
{
ÖÖ 
Status
ÜÜ 
=
ÜÜ 
result
ÜÜ 
}
áá 
;
áá 
var
ââ 
lstFileResult
ââ 
=
ââ 
new
ââ  #
List
ââ$ (
<
ââ( )
UploadFileResult
ââ) 9
>
ââ9 :
(
ââ: ;
)
ââ; <
;
ââ< =
lstFileResult
ää 
.
ää 
Add
ää 
(
ää 

fileResult
ää (
)
ää( )
;
ää) *
return
åå 
Ok
åå 
(
åå 
new
åå  
UploadFileResponse
åå ,
(
åå, -
)
åå- .
{
çç 
UploadFilesResult
éé !
=
éé" #
lstFileResult
éé$ 1
}
èè 
)
èè 
;
èè 
}
êê 	
[
îî 	
HttpPost
îî	 
]
îî 
public
ïï 
IActionResult
ïï 
	PostImage
ïï &
(
ïï& '
	IFormFile
ïï' 0
file
ïï1 5
)
ïï5 6
{
ññ 	
var
óó 
rootPath
óó 
=
óó 
_configuration
óó )
[
óó) *
$str
óó* J
]
óóJ K
;
óóK L
var
òò 
extensionFile
òò 
=
òò 
Path
òò  $
.
òò$ %
GetExtension
òò% 1
(
òò1 2
file
òò2 6
.
òò6 7
FileName
òò7 ?
)
òò? @
.
òò@ A
ToLower
òòA H
(
òòH I
)
òòI J
;
òòJ K
string
ôô 
[
ôô 
]
ôô 
imagesExtension
ôô $
=
ôô% &
new
ôô' *
string
ôô+ 1
[
ôô1 2
]
ôô2 3
{
ôô4 5
$str
ôô6 <
,
ôô< =
$str
ôô> E
,
ôôE F
$str
ôôG M
,
ôôM N
$str
ôôO U
,
ôôU V
$str
ôôW ^
}
ôô_ `
;
ôô` a
string
öö 
mess
öö 
=
öö 
string
öö  
.
öö  !
Empty
öö! &
;
öö& '
bool
õõ 
st
õõ 
=
õõ 
false
õõ 
;
õõ 
if
ùù 
(
ùù 
file
ùù 
.
ùù 
Length
ùù 
>
ùù 
$num
ùù 
&&
ùù  "
imagesExtension
ùù# 2
.
ùù2 3
Contains
ùù3 ;
(
ùù; <
extensionFile
ùù< I
)
ùùI J
)
ùùJ K
{
ûû 
using
üü 
(
üü 
var
üü 

fileStream
üü %
=
üü& '
new
üü( +

FileStream
üü, 6
(
üü6 7
Path
üü7 ;
.
üü; <
Combine
üü< C
(
üüC D
rootPath
üüD L
,
üüL M
file
üüN R
.
üüR S
FileName
üüS [
)
üü[ \
,
üü\ ]
FileMode
üü^ f
.
üüf g
Create
üüg m
)
üüm n
)
üün o
{
†† 
file
°° 
.
°° 
CopyTo
°° 
(
°°  

fileStream
°°  *
)
°°* +
;
°°+ ,
mess
¢¢ 
=
¢¢ 
$str
¢¢ *
;
¢¢* +
st
££ 
=
££ 
true
££ 
;
££ 
}
§§ 
}
¶¶ 
else
¶¶ 
{
¶¶ 
mess
ßß 
=
ßß 
$strßß ê
;ßßê ë
}
®® 
var
™™ 

fileResult
™™ 
=
™™ 
new
™™  
UploadFileResult
™™! 1
{
´´ 
Status
¨¨ 
=
¨¨ 
st
¨¨ 
,
¨¨ 
Message
≠≠ 
=
≠≠ 
mess
≠≠ 
}
ÆÆ 
;
ÆÆ 
var
∞∞ 
lstFileResult
∞∞ 
=
∞∞ 
new
∞∞  #
List
∞∞$ (
<
∞∞( )
UploadFileResult
∞∞) 9
>
∞∞9 :
(
∞∞: ;
)
∞∞; <
;
∞∞< =
lstFileResult
±± 
.
±± 
Add
±± 
(
±± 

fileResult
±± (
)
±±( )
;
±±) *
return
¥¥ 
Ok
¥¥ 
(
¥¥ 
new
¥¥  
UploadFileResponse
¥¥ ,
(
¥¥, -
)
¥¥- .
{
µµ 
UploadFilesResult
∂∂ !
=
∂∂" #
lstFileResult
∂∂$ 1
}
∑∑ 
)
∑∑ 
;
∑∑ 
}
∏∏ 	
}
ππ 
}∫∫ â9
iC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.API\Controllers\UserController.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
API 
. 
Controllers )
{ 
public 

class 
UserController 
:  !
BaseController" 0
{ 
private 
readonly %
IAuthenticationAppService 2%
_authenticationAppService3 L
;L M
private 
readonly 
IUserExternalModule ,
_userExternalModule- @
;@ A
public 
UserController 
( %
IAuthenticationAppService %$
authenticationAppService& >
,> ?
IUserExternalModule 
userExternalModule  2
)2 3
{ 	
this 
. %
_authenticationAppService *
=+ ,$
authenticationAppService- E
;E F
this 
. 
_userExternalModule $
=% &
userExternalModule' 9
;9 :
} 	
[ 	
HttpPost	 
] 
public 
IActionResult 
GetUserDetail *
(* +
[+ ,
FromBody, 4
]4 5 
GetUserDetailRequest6 J 
getUserDetailRequestK _
)_ `
{ 	
if   
(    
getUserDetailRequest   $
==  % '
null  ( ,
||  - /
string  0 6
.  6 7
IsNullOrEmpty  7 D
(  D E 
getUserDetailRequest  E Y
.  Y Z
UserCode  Z b
)  b c
)  c d
{!! 
return"" 

BadRequest"" !
(""! "
$str""" E
)""E F
;""F G
}## 
return%% 
Ok%% 
(%% 
new%% !
GetUserDetailResponse%% /
(%%/ 0
)%%0 1
{&& 
UserDetailProfile'' !
=''" #%
_authenticationAppService(( )
.(() *
getDetailProfile((* :
(((: ; 
getUserDetailRequest((; O
.((O P
UserCode((P X
)((X Y
})) 
))) 
;)) 
}** 	
[,, 	
HttpPost,,	 
],, 
public-- 
IActionResult-- 
ChangePassword-- +
(--+ ,
[--, -
FromBody--- 5
]--5 6!
ChangePasswordRequest--8 M!
changePasswordRequest--N c
)--c d
{.. 	
string// 
mensaje// 
=// 
$str// 
;//  
if00 
(00 !
changePasswordRequest00 %
==00& (
null00) -
||00. 0
string001 7
.007 8
IsNullOrEmpty008 E
(00E F!
changePasswordRequest00F [
.00[ \
UserCode00\ d
)00d e
)00e f
{11 
return22 

BadRequest22 !
(22! "
$str22" E
)22E F
;22F G
}33 
if55 
(55 
User55 
.55 
Identity55 
.55 
Name55 "
!=55# %!
changePasswordRequest55& ;
.55; <
UserCode55< D
)55D E
{66 
return77 

BadRequest77 !
(77! "
$str77" _
)77_ `
;77` a
}88 
bool:: 
resp:: 
=:: 
_userExternalModule:: +
.::+ ,
ChangePassword::, :
(::: ;!
changePasswordRequest::; P
.::P Q
UserCode::Q Y
,::Y Z!
changePasswordRequest::[ p
.::p q
PasswordOld::q |
,::| }"
changePasswordRequest	::~ ì
.
::ì î
PasswordNew
::î ü
,
::ü †
ref
::° §
mensaje
::• ¨
)
::¨ ≠
;
::≠ Æ
var<< 
lstChangePassword<< !
=<<" #
new<<$ '
List<<( ,
<<<, -
ChangePassword<<- ;
><<; <
(<<< =
)<<= >
;<<> ?
lstChangePassword== 
.== 
Add== !
(==! "
new==" %
ChangePassword==& 4
(==4 5
)==5 6
{>> 
Status?? 
=?? 
resp?? 
,?? 
Message@@ 
=@@ 
mensaje@@ !
}AA 
)AA 
;AA 
returnCC 
OkCC 
(CC 
newCC "
ChangePasswordResponseCC 0
(CC0 1
)CC1 2
{DD 
ChangePasswordEE 
=EE  
lstChangePasswordEE! 2
}FF 
)FF 
;FF 
}GG 	
[II 	
HttpPostII	 
]II 
publicJJ 
IActionResultJJ 
ChangePasswordAdminJJ 0
(JJ0 1
[JJ1 2
FromBodyJJ2 :
]JJ: ;&
ChangePasswordAdminRequestJJ= W&
changePasswordAdminRequestJJX r
)JJr s
{KK 	
stringLL 
mensajeLL 
=LL 
$strLL 
;LL  
ifMM 
(MM &
changePasswordAdminRequestMM *
==MM+ -
nullMM. 2
||MM3 5
stringMM6 <
.MM< =
IsNullOrEmptyMM= J
(MMJ K&
changePasswordAdminRequestMMK e
.MMe f
UserCodeMMf n
)MMn o
)MMo p
{NN 
returnOO 

BadRequestOO !
(OO! "
$strOO" E
)OOE F
;OOF G
}PP 
ifQQ 
(QQ 
UserQQ 
.QQ 
IdentityQQ 
.QQ 
NameQQ "
!=QQ# %&
changePasswordAdminRequestQQ& @
.QQ@ A
UserCodeQQA I
)QQI J
{RR 
returnSS 

BadRequestSS !
(SS! "
$strSS" _
)SS_ `
;SS` a
}TT 
boolVV 
respVV 
=VV 
_userExternalModuleVV +
.VV+ ,
ChangePasswordAdminVV, ?
(VV? @&
changePasswordAdminRequestVV@ Z
.VVZ [
UserCodeVV[ c
,VVc d&
changePasswordAdminRequestVVe 
.	VV Ä
PasswordNew
VVÄ ã
,
VVã å
ref
VVç ê
mensaje
VVë ò
)
VVò ô
;
VVô ö
varXX 
lstChangePasswordXX !
=XX" #
newXX$ '
ListXX( ,
<XX, -
ChangePasswordXX- ;
>XX; <
(XX< =
)XX= >
;XX> ?
lstChangePasswordYY 
.YY 
AddYY !
(YY! "
newYY" %
ChangePasswordYY& 4
(YY4 5
)YY5 6
{ZZ 
Status[[ 
=[[ 
resp[[ 
,[[ 
Message\\ 
=\\ 
mensaje\\ !
}]] 
)]] 
;]] 
return__ 
Ok__ 
(__ 
new__ "
ChangePasswordResponse__ 0
(__0 1
)__1 2
{`` 
ChangePasswordaa 
=aa  
lstChangePasswordaa! 2
}bb 
)bb 
;bb 
}cc 	
}dd 
}ee Õ

kC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.API\Controllers\ValuesController.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
API 
. 
Controllers )
{		 
[

 
ApiController

 
]

 
public 

class 
ValuesController !
:" #
BaseController$ 2
{ 
[ 	
	Authorize	 
] 
[ 	
HttpGet	 
] 
public 
ActionResult 
< 
IEnumerable '
<' (
string( .
>. /
>/ 0
Get1 4
(4 5
)5 6
{ 	
return 
new 
string 
[ 
] 
{  !
$str" *
,* +
$str, 4
}5 6
;6 7
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
ActionResult 
< 
string "
>" #
Get$ '
(' (
int( +
id, .
). /
{ 	
return 
$str 
; 
} 	
} 
} «
rC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.API\InstanceProviders\ContainerProvider.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
API 
. 
InstanceProviders /
{ 
public 

static 
class 
ContainerProvider )
{ 
public 
static 
IServiceCollection (
ConfigureDI) 4
(4 5
this 
IServiceCollection #
services$ ,
), -
{ 	
ConfigureContainer 
( 
services '
)' (
;( )
return 
services 
; 
} 	
private 
static 
void 
ConfigureContainer .
(. /
IServiceCollection/ A
servicesB J
)J K
{ 	
services 
. 
AddTransient !
<! "%
IAuthenticationAppService" ;
,; <$
AuthenticationAppService= U
>U V
(V W
)W X
;X Y
services 
. 
AddTransient !
<! "
ICampaignAppService" 5
,5 6
CampaignAppService7 I
>I J
(J K
)K L
;L M
services   
.   
AddTransient   !
<  ! "
IAwardAppService  " 2
,  2 3
AwardAppService  4 C
>  C D
(  D E
)  E F
;  F G
services!! 
.!! 
AddTransient!! !
<!!! "
ICampaignAdapter!!" 2
,!!2 3
CampaignAdapter!!4 C
>!!C D
(!!D E
)!!E F
;!!F G
services"" 
."" 
AddTransient"" !
<""! "
IUserExternalModule""" 5
,""5 6
UserExternalModule""7 I
>""I J
(""J K
)""K L
;""L M
services## 
.## 
AddTransient## !
<##! "
ISecurityService##" 2
,##2 3
SecurityService##4 C
>##C D
(##D E
)##E F
;##F G
services$$ 
.$$ 
AddTransient$$ !
<$$! "

ILDAPAgent$$" ,
,$$, -
	LDAPAgent$$. 7
>$$7 8
($$8 9
)$$9 :
;$$: ;
services%% 
.%% 
AddTransient%% !
<%%! "
IClosedXMLAgent%%" 1
,%%1 2
ClosedXMLAgent%%3 A
>%%A B
(%%B C
)%%C D
;%%D E
services'' 
.'' 
	AddScoped'' 
<'' 
ApiExceptionFilter'' 1
>''1 2
(''2 3
)''3 4
;''4 5
}(( 	
})) 
}** ª	
VC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.API\Program.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
API 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	 
CreateWebHostBuilder  
(  !
args! %
)% &
.& '
Build' ,
(, -
)- .
.. /
Run/ 2
(2 3
)3 4
;4 5
} 	
public 
static 
IWebHostBuilder % 
CreateWebHostBuilder& :
(: ;
string; A
[A B
]B C
argsD H
)H I
=>J L
WebHost 
.  
CreateDefaultBuilder (
(( )
args) -
)- .
. 

UseStartup 
< 
Startup #
># $
($ %
)% &
;& '
} 
} ﬁ+
VC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.API\Startup.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
API 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public"" 
void"" 
ConfigureServices"" %
(""% &
IServiceCollection""& 8
services""9 A
)""A B
{## 	
services$$ 
.$$ 
AddSingleton$$ !
<$$! " 
IHttpContextAccessor$$" 6
,$$6 7
HttpContextAccessor$$8 K
>$$K L
($$L M
)$$M N
;$$N O
services%% 
.%% 
AddTransient%% !
<%%! "

IPrincipal%%" ,
>%%, -
(%%- .
provider&& 
=>&& 
provider&& $
.&&$ %

GetService&&% /
<&&/ 0 
IHttpContextAccessor&&0 D
>&&D E
(&&E F
)&&F G
.&&G H
HttpContext&&H S
.&&S T
User&&T X
)&&X Y
;&&Y Z
services(( 
.)) 
AddDbContext)) 
<)) 
PremiosContext)) ,
>)), -
())- .
opt)). 1
=>))2 4
opt))5 8
.))8 9
UseSqlServer))9 E
())E F
Configuration))F S
.))S T
GetConnectionString))T g
())g h
$str))h y
)))y z
)))z {
))){ |
.** 
AddUnitOfWork** 
<** 
PremiosContext** -
>**- .
(**. /
)**/ 0
;**0 1
services,, 
.,, 
ConfigureDI,,  
(,,  !
),,! "
;,," #
services-- 
.-- 

AddOptions-- 
(--  
)--  !
;--! "
services.. 
... 
AddCors.. 
(.. 
o.. 
=>.. !
o.." #
...# $
	AddPolicy..$ -
(..- .
$str... :
,..: ;
builder..< C
=>..D F
{// 
builder00 
.00 
AllowAnyOrigin00 &
(00& '
)00' (
.11 
AllowAnyMethod11 '
(11' (
)11( )
.22 
AllowAnyHeader22 '
(22' (
)22( )
.33 
AllowCredentials33 )
(33) *
)33* +
;33+ ,
};; 
);; 
);; 
;;; 
services== 
.== 
AddAuthentication== &
(==& '
$str==' /
)==/ 0
.>> +
AddIdentityServerAuthentication>> /
(>>/ 0
options>>0 7
=>>>8 :
{?? 
options@@ 
.@@ 
	Authority@@ $
=@@% &
Configuration@@' 4
[@@4 5
$str@@5 Q
]@@Q R
;@@R S
optionsAA 
.AA  
RequireHttpsMetadataAA /
=AA0 1
falseAA2 7
;AA7 8
optionsCC 
.CC 
ApiNameCC "
=CC# $
	ConstantsCC% .
.CC. /
IdentityServerCC/ =
.CC= >"
API_RESOURCE_PROTOCOLSCC> T
;CCT U
}DD 
)DD 
;DD 
servicesHH 
.HH 
AddMvcHH 
(HH 
)HH 
.II #
SetCompatibilityVersionII (
(II( ) 
CompatibilityVersionII) =
.II= >
Version_2_1II> I
)III J
.JJ 
AddJsonOptionsJJ 
(JJ  
optionsJJ  '
=>JJ( *
{KK 
optionsLL 
.LL 
SerializerSettingsLL .
.LL. /
ContractResolverLL/ ?
=LL@ A
newLLB E

NewtonsoftLLF P
.LLP Q
JsonLLQ U
.LLU V
SerializationLLV c
.LLc d#
DefaultContractResolverLLd {
(LL{ |
)LL| }
;LL} ~
}MM 
)MM 
;MM 
}OO 	
publicRR 
voidRR 
	ConfigureRR 
(RR 
IApplicationBuilderRR 1
appRR2 5
,RR5 6
IHostingEnvironmentRR7 J
envRRK N
)RRN O
{SS 	
ifTT 
(TT 
envTT 
.TT 
IsDevelopmentTT !
(TT! "
)TT" #
)TT# $
{UU 
appVV 
.VV %
UseDeveloperExceptionPageVV -
(VV- .
)VV. /
;VV/ 0
}WW 
appXX 
.XX "
UseApiExceptionHandlerXX &
(XX& '
)XX' (
;XX( )
appYY 
.YY 
UseAllowAllCORSYY 
(YY  
)YY  !
;YY! "
appZZ 
.ZZ 
UseCorsZZ 
(ZZ 
$strZZ $
)ZZ$ %
;ZZ% &
app[[ 
.[[ 
UseAuthentication[[ !
([[! "
)[[" #
;[[# $
app\\ 
.\\ 
UseStaticFiles\\ 
(\\ 
)\\  
;\\  !
app]] 
.]] 
UseMvc]] 
(]] 
)]] 
;]] 
}^^ 	
}__ 
}`` ı
oC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.API\_Code\ExceptionHandling\ApiError.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
API 
. 
_Code #
.# $
ExceptionHandling$ 5
{ 
public		 

class		 
ApiError		 
{

 
public 
string 
message 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
	errorType 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
detail 
{ 
get "
;" #
set$ '
;' (
}) *
public 
ApiError 
( 
string 
message &
)& '
{ 	
this 
. 
message 
= 
message "
;" #
} 	
public 
ApiError 
(  
ModelStateDictionary ,

modelState- 7
)7 8
{ 	
if 
( 

modelState 
!= 
null "
&&# %

modelState& 0
.0 1
Any1 4
(4 5
m5 6
=>7 9
m: ;
.; <
Value< A
.A B
ErrorsB H
.H I
CountI N
>O P
$numQ R
)R S
)S T
{ 
message 
= 
$str N
;N O
} 
} 	
} 
} ò
sC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.API\_Code\ExceptionHandling\ApiException.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
API 
. 
_Code #
.# $
ExceptionHandling$ 5
{ 
public 

class 
ApiException 
: 
	Exception  )
{		 
public

 
int

 

StatusCode

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
ApiException 
( 
	Exception %
ex& (
,( )
int* -

statusCode. 8
=9 :
$num; >
)> ?
:@ A
baseB F
(F G
exG I
.I J
MessageJ Q
)Q R
{ 	

StatusCode 
= 

statusCode #
;# $
} 	
} 
} •
|C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.API\_Code\ExceptionHandling\ApiExceptionExtension.cs
	namespace

 	
Belcorp


 
.

 
Premios

 
.

 
API

 
.

 
_Code

 #
.

# $
ExceptionHandling

$ 5
{ 
public 

static 
class !
ApiExceptionExtension -
{ 
public 
static 
IApplicationBuilder )"
UseApiExceptionHandler* @
(@ A
thisA E
IApplicationBuilderF Y
appZ ]
)] ^
{ 	
if 
( 
app 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
app7 :
): ;
); <
;< =
} 
return 
app 
. 
UseExceptionHandler *
(* +
errorApp+ 3
=>4 6
errorApp 
. 
Run 
( 
async "
(# $
context$ +
)+ ,
=>- /
{ 
context 
. 
Response $
.$ %

StatusCode% /
=0 1
$num2 5
;5 6
context 
. 
Response $
.$ %
ContentType% 0
=1 2
$str3 >
;> ?
await 
context !
.! "
Response" *
.* +

WriteAsync+ 5
(5 6
$str6 H
)H I
;I J
await 
context !
.! "
Response" *
.* +

WriteAsync+ 5
(5 6
$str m
)m n
;n o
var   
error   
=   
context    '
.  ' (
Features  ( 0
.  0 1
Get  1 4
<  4 5$
IExceptionHandlerFeature  5 M
>  M N
(  N O
)  O P
;  P Q
if!! 
(!! 
error!! 
!=!!  
null!!! %
)!!% &
{"" 
await$$ 
context%% 
.%%  
Response%%  (
.%%( )

WriteAsync%%) 3
(%%3 4
$str%%4 A
+%%B C
HtmlEncoder&&4 ?
.&&? @
Default&&@ G
.&&G H
Encode&&H N
(&&N O
error&&O T
.&&T U
Error&&U Z
.&&Z [
Message&&[ b
)&&b c
+&&d e
$str''4 >
)''> ?
;''? @
}(( 
await)) 
context)) !
.))! "
Response))" *
.))* +

WriteAsync))+ 5
())5 6
$str))6 Z
)))Z [
;))[ \
await** 
context** !
.**! "
Response**" *
.*** +

WriteAsync**+ 5
(**5 6
$str**6 J
)**J K
;**K L
await++ 
context++ !
.++! "
Response++" *
.++* +

WriteAsync+++ 5
(++5 6
new++6 9
string++: @
(++@ A
$char++A D
,++D E
$num++F I
)++I J
)++J K
;++K L
},, 
),, 
),, 
;,, 
}-- 	
}.. 
}// ¶1
yC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.API\_Code\ExceptionHandling\ApiExceptionFilter.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
API 
. 
_Code #
.# $
ExceptionHandling$ 5
{ 
public 

class 
ApiExceptionFilter #
:$ %$
ExceptionFilterAttribute& >
{ 
private 
readonly 
ILogger  
<  !
ApiExceptionFilter! 3
>3 4
_Logger5 <
;< =
public 
ApiExceptionFilter !
(! "
ILogger" )
<) *
ApiExceptionFilter* <
>< =
logger> D
)D E
{ 	
_Logger 
= 
logger 
; 
} 	
public 
override 
void 
OnException (
(( )
ExceptionContext) 9
context: A
)A B
{ 	
ApiError 
apiError 
= 
null  $
;$ %
BaseResponse 
baseResponse %
=& '
null( ,
;, -
if 
( 
context 
. 
	Exception !
is" $
ApiException% 1
)1 2
{ 
var   
ex   
=   
context    
.    !
	Exception  ! *
as  + -
ApiException  . :
;  : ;
context!! 
.!! 
	Exception!! !
=!!" #
null!!$ (
;!!( )
apiError"" 
="" 
new"" 
ApiError"" '
(""' (
ex""( *
.""* +
Message""+ 2
)""2 3
;""3 4
context## 
.## 
HttpContext## #
.### $
Response##$ ,
.##, -

StatusCode##- 7
=##8 9
ex##: <
.##< =

StatusCode##= G
;##G H
_Logger%% 
.%% 

LogWarning%% "
(%%" #
$"%%# %&
Application thrown error: %%% ?
{%%? @
ex%%@ B
.%%B C
Message%%C J
}%%J K
"%%K L
,%%L M
ex%%N P
)%%P Q
;%%Q R
}&& 
else'' 
if'' 
('' 
context'' 
.'' 
	Exception'' &
is''' )'
UnauthorizedAccessException''* E
)''E F
{(( 
apiError)) 
=)) 
new)) 
ApiError)) '
())' (
$str))( =
)))= >
;))> ?
context** 
.** 
HttpContext** #
.**# $
Response**$ ,
.**, -

StatusCode**- 7
=**8 9
$num**: =
;**= >
_Logger++ 
.++ 

LogWarning++ "
(++" #
$str++# N
)++N O
;++O P
},, 
else-- 
if-- 
(-- 
context-- 
.-- 
	Exception-- &
is--' )
DominioException--* :
)--: ;
{.. 
var// 
ex// 
=// 
context//  
.//  !
	Exception//! *
as//+ -
DominioException//. >
;//> ?
context00 
.00 
	Exception00 !
=00" #
null00$ (
;00( )
baseResponse22 
=22 
new22 "
BaseResponse22# /
(22/ 0
)220 1
;221 2
baseResponse33 
.33 
StateResponse33 *
.33* +
HasError33+ 3
=334 5
true336 :
;33: ;
baseResponse44 
.44 
StateResponse44 *
.44* +
	TipoError44+ 4
=445 6
	Constants447 @
.44@ A
	TipoError44A J
.44J K
DOMINIO44K R
;44R S
baseResponse55 
.55 
StateResponse55 *
.55* +
MensajeError55+ 7
=558 9
ex55: <
.55< =
Message55= D
;55D E
context77 
.77 
ExceptionHandled77 (
=77) *
true77+ /
;77/ 0
}88 
else99 
{:: 
var@@ 
msg@@ 
=@@ 
context@@ !
.@@! "
	Exception@@" +
.@@+ ,
GetBaseException@@, <
(@@< =
)@@= >
.@@> ?
Message@@? F
;@@F G
stringAA 
stackAA 
=AA 
contextAA &
.AA& '
	ExceptionAA' 0
.AA0 1

StackTraceAA1 ;
;AA; <
apiErrorDD 
=DD 
newDD 
ApiErrorDD '
(DD' (
msgDD( +
)DD+ ,
;DD, -
apiErrorEE 
.EE 
detailEE 
=EE  !
stackEE" '
;EE' (
contextGG 
.GG 
HttpContextGG #
.GG# $
ResponseGG$ ,
.GG, -

StatusCodeGG- 7
=GG8 9
$numGG: =
;GG= >
_LoggerII 
.II 
LogErrorII  
(II  !
contextII! (
.II( )
	ExceptionII) 2
.II2 3
GetBaseExceptionII3 C
(IIC D
)IID E
.IIE F

StackTraceIIF P
,IIP Q
contextIIR Y
.IIY Z
	ExceptionIIZ c
)IIc d
;IId e
}JJ 
ifMM 
(MM 
baseResponseMM 
!=MM 
nullMM  $
)MM$ %
{NN 
contextOO 
.OO 
ResultOO 
=OO  
newOO! $

JsonResultOO% /
(OO/ 0
baseResponseOO0 <
)OO< =
;OO= >
}PP 
elseQQ 
{RR 
contextSS 
.SS 
ResultSS 
=SS  
newSS! $

JsonResultSS% /
(SS/ 0
apiErrorSS0 8
)SS8 9
;SS9 :
}TT 
baseVV 
.VV 
OnExceptionVV 
(VV 
contextVV $
)VV$ %
;VV% &
}WW 	
}XX 
}ZZ 