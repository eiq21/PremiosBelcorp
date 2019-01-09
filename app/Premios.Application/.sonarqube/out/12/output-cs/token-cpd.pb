Å
|C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Security.API\Controllers\AuthenticationController.cs
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
 
Security

 "
.

" #
API

# &
.

& '
Controllers

' 2
{ 
public 

class $
AuthenticationController )
:* +
BaseController, :
{ 
private 
readonly %
IAuthenticationAppService 2%
_authenticationAppService3 L
;L M
public $
AuthenticationController '
(' (%
IAuthenticationAppService( A$
authenticationAppServiceB Z
)Z [
{ 	%
_authenticationAppService %
=& '$
authenticationAppService( @
;@ A
} 	
[ 	
HttpPost	 
] 
public  
ValidateUserResponse #
ValidateUser$ 0
(0 1
[1 2
FromBody2 :
]: ;
ValidateUserRequest; N
validateUserRequestO b
)b c
{ 	
return 
new  
ValidateUserResponse +
{ 
isAuthenticated 
=  !%
_authenticationAppService" ;
.; <
ValidateUser< H
(H I
validateUserRequestI \
.\ ]
Username] e
,e f
validateUserRequestg z
.z {
Password	{ É
)
É Ñ
} 
; 
} 	
} 
} ¡
rC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Security.API\Controllers\BaseController.cs
	namespace		 	
Belcorp		
 
.		 
Premios		 
.		 
Security		 "
.		" #
API		# &
.		& '
Controllers		' 2
{

 
[ 
ServiceFilter 
( 
typeof 
( 
ApiExceptionFilter ,
), -
)- .
]. /
[ 
Route 

(
 
$str &
)& '
]' (
[ 

EnableCors 
( 
$str 
) 
]  
public 

class 
BaseController 
:  !

Controller" ,
{ 
} 
} ß
tC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Security.API\Controllers\ValuesController.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Security "
." #
API# &
.& '
Controllers' 2
{ 
[		 
Route		 

(		
 
$str		 
)		 
]		 
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
ControllerBase$ 2
{ 
[ 	
HttpGet	 
] 
public 
ActionResult 
< 
IEnumerable '
<' (
string( .
>. /
>/ 0
Get1 4
(4 5
)5 6
{ 	
return 
new 
string 
[ 
] 
{  !
$str" *
,* +
$str, 4
}5 6
;6 7
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
ActionResult 
< 
string "
>" #
Get$ '
(' (
int( +
id, .
). /
{ 	
return 
$str 
; 
} 	
} 
} Ò
{C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Security.API\InstanceProviders\ContainerProvider.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Security "
." #
API# &
.& '
InstanceProviders' 8
{ 
public 

static 
class 
ContainerProvider )
{ 
public 
static 
IServiceCollection (
ConfigureDI) 4
(4 5
this 
IServiceCollection #
services$ ,
), -
{ 	
ConfigureContainer 
( 
services '
)' (
;( )
ConfigureFactories 
( 
)  
;  !
ConfigureProviders 
( 
services '
)' (
;( )
return 
services 
; 
} 	
static 
void 
ConfigureContainer &
(& '
IServiceCollection' 9
services: B
)B C
{ 	
services 
. 
AddTransient !
<! "%
IAuthenticationAppService" ;
,; <$
AuthenticationAppService= U
>U V
(V W
)W X
;X Y
services 
. 
AddTransient !
<! "
ISecurityService" 2
,2 3
SecurityService4 C
>C D
(D E
)E F
;F G
services 
. 
AddTransient !
<! "
IUserSpecification" 4
,4 5
UserSpecification6 G
>G H
(H I
)I J
;J K
services!! 
.!! 
	AddScoped!! 
<!! 
ApiExceptionFilter!! 1
>!!1 2
(!!2 3
)!!3 4
;!!4 5
services%% 
.%% 
	AddScoped%% 
<%% 

ILDAPAgent%% )
,%%) *
	LDAPAgent%%+ 4
>%%4 5
(%%5 6
)%%6 7
;%%7 8
}&& 	
static(( 
void(( 
ConfigureFactories(( &
(((& '
)((' (
{)) 	
}++ 	
static-- 
void-- 
ConfigureProviders-- &
(--& '
IServiceCollection--' 9
services--: B
)--B C
{.. 	
}00 	
}11 
}22 ¬
_C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Security.API\Program.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Security "
." #
API# &
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
. 

UseSetting 
( 
$str ,
,, -
$str. 4
)4 5
.  
CaptureStartupErrors %
(% &
true& *
)* +
;+ ,
} 
} Í+
_C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Security.API\Startup.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Security "
." #
API# &
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
,3 4
IHostingEnvironment5 H
envI L
)L M
{ 	
Configuration 
= 
configuration )
;) *
_environment 
= 
env 
; 
} 	
private"" 
readonly"" 
IHostingEnvironment"" ,
_environment""- 9
;""9 :
public## 
IConfiguration## 
Configuration## +
{##, -
get##. 1
;##1 2
}##3 4
public&& 
void&& 
ConfigureServices&& %
(&&% &
IServiceCollection&&& 8
services&&9 A
)&&A B
{'' 	
services)) 
.** 
AddDbContext** 
<** 
PremiosContext** ,
>**, -
(**- .
opt**. 1
=>**2 4
opt**5 8
.**8 9
UseSqlServer**9 E
(**E F
Configuration**F S
.**S T
GetConnectionString**T g
(**g h
$str**h y
)**y z
)**z {
)**{ |
.++ 
AddUnitOfWork++ 
<++ 
PremiosContext++ -
>++- .
(++. /
)++/ 0
;++0 1
services-- 
.-- 
ConfigureDI--  
(--  !
)--! "
;--" #
services.. 
... 

AddOptions.. 
(..  
)..  !
;..! "
services00 
.00 
	Configure00 
<00 

LdapConfig00 )
>00) *
(00* +
Configuration00+ 8
.008 9

GetSection009 C
(00C D
$str00D P
)00P Q
)00Q R
;00R S
services11 
.11 
AddSecurity11  
(11  !
Configuration11! .
)11. /
;11/ 0
var33 
cert33 
=33 
new33 
X509Certificate233 +
(33+ ,
Path44 
.44 
Combine44 
(44 
_environment44 )
.44) *
ContentRootPath44* 9
,449 :
Configuration44; H
[44H I
$str44I i
]44i j
)44j k
,44k l
Configuration55 
[55 
$str55 B
]55B C
,55C D
X509KeyStorageFlags66 #
.66# $
MachineKeySet66$ 1
)661 2
;662 3
ConfigIdentity88 
.88 
Init88 
(88  
Configuration88  -
)88- .
;88. /
services:: 
.:: 
AddIdentityServer:: &
(::& '
)::' (
.;;  
AddSigningCredential;; %
(;;% &
cert;;& *
);;* +
.<< (
AddInMemoryIdentityResources<< -
(<<- .
ConfigIdentity<<. <
.<<< = 
GetIdentityResources<<= Q
(<<Q R
)<<R S
)<<S T
.== #
AddInMemoryApiResources== (
(==( )
ConfigIdentity==) 7
.==7 8
GetApiResources==8 G
(==G H
)==H I
)==I J
.>> 
AddInMemoryClients>> #
(>># $
ConfigIdentity>>$ 2
.>>2 3

GetClients>>3 =
(>>= >
)>>> ?
)>>? @
.?? 
AddCustomUserStore?? #
(??# $
)??$ %
;??% &
servicesII 
.II 
AddMvcII 
(II 
)II 
.JJ 
AddJsonOptionsJJ 
(JJ 
optionsJJ #
=>JJ$ &
{KK 
optionsLL 
.LL 
SerializerSettingsLL *
.LL* +
ContractResolverLL+ ;
=LL< =
newLL> A

NewtonsoftLLB L
.LLL M
JsonLLM Q
.LLQ R
SerializationLLR _
.LL_ `#
DefaultContractResolverLL` w
(LLw x
)LLx y
;LLy z
}MM 
)MM 
;MM 
}NN 	
publicQQ 
voidQQ 
	ConfigureQQ 
(QQ 
IApplicationBuilderQQ 1
appQQ2 5
,QQ5 6
IHostingEnvironmentQQ7 J
envQQK N
)QQN O
{RR 	
ifSS 
(SS 
envSS 
.SS 
IsDevelopmentSS !
(SS! "
)SS" #
)SS# $
{TT 
appUU 
.UU %
UseDeveloperExceptionPageUU -
(UU- .
)UU. /
;UU/ 0
}VV 
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
.ZZ 
UseIdentityServerZZ !
(ZZ! "
)ZZ" #
;ZZ# $
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
app^^ 
.^^ 
UseMvc^^ 
(^^ 
)^^ 
;^^ 
}__ 	
}`` 
}aa ˛H
{C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Security.API\_Code\CustomIdentity\ConfigIdentity.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Security "
." #
API# &
.& '
CustomIdentity' 5
{ 
public 

static 
class 
ConfigIdentity &
{ 
private 
static 
IConfiguration %
_configuration& 4
;4 5
public 
static 
void 
Init 
(  
IConfiguration  .
configuration/ <
)< =
{ 	
_configuration 
= 
configuration *
;* +
} 	
public 
static 
IEnumerable !
<! "
IdentityResource" 2
>2 3 
GetIdentityResources4 H
(H I
)I J
{ 	
return 
new 
List 
< 
IdentityResource ,
>, -
(- .
). /
{0 1
new 
IdentityResources %
.% &
OpenId& ,
(, -
)- .
,. /
new 
IdentityResources %
.% &
Profile& -
(- .
). /
,/ 0
new 
IdentityResources %
.% &
Email& +
(+ ,
), -
,- .
} 
; 
} 	
public 
static 
IEnumerable !
<! "
ApiResource" -
>- .
GetApiResources/ >
(> ?
)? @
{   	
return!! 
new!! 
List!! 
<!! 
ApiResource!! '
>!!' (
{"" 
new## 
ApiResource## 
(##  
	Constants##  )
.##) *
IdentityServer##* 8
.##8 9"
API_RESOURCE_PROTOCOLS##9 O
)##O P
{$$ 

ApiSecrets%% 
=%%  
{&& 
new'' 
Secret'' "
(''" #
_configuration''# 1
[''1 2
$str''2 ]
]''] ^
.''^ _
Sha256''_ e
(''e f
)''f g
)''g h
}(( 
,(( 
Scopes)) 
=)) 
{** 
new++ 
Scope++ !
{,, 
Name--  
=--! "
	Constants--# ,
.--, -
IdentityServer--- ;
.--; <(
API_RESOURCE_PROTOCOLS_SCOPE--< X
,--X Y
DisplayName.. '
=..( )
$str..* R
}// 
}00 
,00 

UserClaims11 
=11  
{11! "
$str11# )
,11) *
$str11+ 1
,111 2
$str113 :
,11: ;
$str11< B
,11B C
	Constants11D M
.11M N
IdentityServer11N \
.11\ ]"
API_RESOURCE_PROTOCOLS11] s
}11t u
}22 
,22 
new33 
ApiResource33 
(33  
	Constants33  )
.33) *
IdentityServer33* 8
.338 9!
API_RESOURCE_SECURITY339 N
)33N O
{44 

ApiSecrets55 
=55  
{66 
new77 
Secret77 "
(77" #
_configuration77# 1
[771 2
$str772 \
]77\ ]
.77] ^
Sha25677^ d
(77d e
)77e f
)77f g
}88 
,88 
Scopes99 
=99 
{:: 
new;; 
Scope;; !
{<< 
Name==  
===! "
	Constants==# ,
.==, -
IdentityServer==- ;
.==; <'
API_RESOURCE_SECURITY_SCOPE==< W
,==W X
DisplayName>> '
=>>( )
$str>>* Q
}?? 
}@@ 
,@@ 

UserClaimsAA 
=AA  
{AA! "
$strAA# )
,AA) *
$strAA+ 1
,AA1 2
$strAA3 :
,AA: ;
$strAA< B
,AAB C
	ConstantsAAD M
.AAM N
IdentityServerAAN \
.AA\ ]!
API_RESOURCE_SECURITYAA] r
}AAs t
}BB 
}CC 
;CC 
}DD 	
publicGG 
staticGG 
IEnumerableGG !
<GG! "
ClientGG" (
>GG( )

GetClientsGG* 4
(GG4 5
)GG5 6
{HH 	
returnII 
newII 
ListII 
<II 
ClientII "
>II" #
(II# $
)II$ %
{JJ 
newKK 
ClientKK 
{LL 
ClientIdMM 
=MM 
	ConstantsMM (
.MM( )
IdentityServerMM) 7
.MM7 8
	CLIENT_IDMM8 A
,MMA B
AllowedGrantTypesNN %
=NN& '

GrantTypesNN( 2
.NN2 3!
ResourceOwnerPasswordNN3 H
,NNH I,
 AlwaysIncludeUserClaimsInIdTokenOO 4
=OO5 6
trueOO7 ;
,OO; <
ClientSecretsRR !
=RR" #
{SS 
newTT 
SecretTT "
(TT" #
_configurationTT# 1
[TT1 2
$strTT2 O
]TTO P
.TTP Q
Sha256TTQ W
(TTW X
)TTX Y
)TTY Z
}UU 
,UU 
AllowedScopesVV !
=VV" #
{VV$ %#
IdentityServerConstantsWW /
.WW/ 0
StandardScopesWW0 >
.WW> ?
OpenIdWW? E
,WWE F#
IdentityServerConstantsXX /
.XX/ 0
StandardScopesXX0 >
.XX> ?
ProfileXX? F
,XXF G#
IdentityServerConstantsYY /
.YY/ 0
StandardScopesYY0 >
.YY> ?
EmailYY? D
,YYD E#
IdentityServerConstantsZZ /
.ZZ/ 0
StandardScopesZZ0 >
.ZZ> ?
OfflineAccessZZ? L
,ZZL M
	Constants[[ !
.[[! "
IdentityServer[[" 0
.[[0 1"
API_RESOURCE_PROTOCOLS[[1 G
,[[G H
	Constants[[I R
.[[R S
IdentityServer[[S a
.[[a b!
API_RESOURCE_SECURITY[[b w
}\\ 
}]] 
,]] 
new^^ 
Client^^ 
{__ 
ClientId`` 
=`` 
	Constants`` (
.``( )
IdentityServer``) 7
.``7 8
CLIENT_TOKEN_ID``8 G
,``G H
AllowedGrantTypesbb %
=bb& '

GrantTypesbb( 2
.bb2 3!
ResourceOwnerPasswordbb3 H
,bbH I,
 AlwaysIncludeUserClaimsInIdTokencc 4
=cc5 6
truecc7 ;
,cc; <
AccessTokenTypeff #
=ff$ %
AccessTokenTypeff& 5
.ff5 6
Jwtff6 9
,ff9 :
AccessTokenLifetimegg '
=gg( )
intgg* -
.gg- .
Parsegg. 3
(gg3 4
_configurationgg4 B
[ggB C
$strggC g
]ggg h
)ggh i
,ggi j!
IdentityTokenLifetimehh )
=hh* +
inthh, /
.hh/ 0
Parsehh0 5
(hh5 6
_configurationhh6 D
[hhD E
$strhhE k
]hhk l
)hhl m
,hhm n,
 UpdateAccessTokenClaimsOnRefreshii 4
=ii5 6
trueii7 ;
,ii; <'
SlidingRefreshTokenLifetimejj /
=jj0 1
$numjj2 4
,jj4 5
AllowOfflineAccesskk &
=kk' (
truekk) -
,kk- ."
RefreshTokenExpirationll *
=ll+ ,
TokenExpirationll- <
.ll< =
Absolutell= E
,llE F
RefreshTokenUsagemm %
=mm& '

TokenUsagemm( 2
.mm2 3
OneTimeOnlymm3 >
,mm> ?"
AlwaysSendClientClaimsnn *
=nn+ ,
truenn- 1
,nn1 2
Enabledoo 
=oo 
trueoo "
,oo" #
ClientSecretspp !
=pp" #
newpp% (
Listpp) -
<pp- .
Secretpp. 4
>pp4 5
{pp6 7
newpp8 ;
Secretpp< B
(ppB C
_configurationppC Q
[ppQ R
$strppR |
]pp| }
.pp} ~
Sha256	pp~ Ñ
(
ppÑ Ö
)
ppÖ Ü
)
ppÜ á
}
ppà â
,
ppâ ä
AllowedScopesqq !
=qq" #
{qq$ %#
IdentityServerConstantsrr /
.rr/ 0
StandardScopesrr0 >
.rr> ?
OpenIdrr? E
,rrE F#
IdentityServerConstantsss /
.ss/ 0
StandardScopesss0 >
.ss> ?
Profiless? F
,ssF G#
IdentityServerConstantstt /
.tt/ 0
StandardScopestt0 >
.tt> ?
Emailtt? D
,ttD E#
IdentityServerConstantsuu /
.uu/ 0
StandardScopesuu0 >
.uu> ?
OfflineAccessuu? L
,uuL M
	Constantsvv !
.vv! "
IdentityServervv" 0
.vv0 1"
API_RESOURCE_PROTOCOLSvv1 G
,vvG H
	ConstantsvvI R
.vvR S
IdentityServervvS a
.vva b!
API_RESOURCE_SECURITYvvb w
}ww 
}xx 
}yy 
;yy 
}zz 	
}{{ 
}|| ¶
ÅC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Security.API\_Code\CustomIdentity\CustomProfileService.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Security "
." #
API# &
.& '
CustomIdentity' 5
{ 
public 

class  
CustomProfileService %
:& '
IProfileService( 7
{ 
	protected 
readonly 
ILogger "
Logger# )
;) *
private 
readonly %
IAuthenticationAppService 2%
_authenticationAppService3 L
;L M
public  
CustomProfileService #
(# $
ILogger 
<  
CustomProfileService (
>( )
logger* 0
,0 1%
IAuthenticationAppService %$
authenticationAppService& >
)> ?
{ 	
Logger 
= 
logger 
; %
_authenticationAppService %
=& '$
authenticationAppService( @
;@ A
} 	
public 
async 
Task 
GetProfileDataAsync -
(- .%
ProfileDataRequestContext. G
contextH O
)O P
{ 	
UserDetailProfile   
udp   !
=  " #
null  $ (
;  ( )
await"" 
Task"" 
."" 
Run"" 
("" 
("" 
)"" 
=>""  
{""! "
udp## 
=## %
_authenticationAppService## /
.##/ 0
getDetailProfile##0 @
(##@ A
context##A H
.##H I
Subject##I P
.##P Q
GetSubjectId##Q ]
(##] ^
)##^ _
)##_ `
;##` a
}$$ 
)$$ 
;$$ 
var'' 
claims'' 
='' 
new'' 
List'' !
<''! "
Claim''" '
>''' (
{(( 
new)) 
Claim)) 
()) 
$str))  
,))  !
context))" )
.))) *
Subject))* 1
.))1 2
GetSubjectId))2 >
())> ?
)))? @
)))@ A
,))A B
new** 
Claim** 
(** 
$str** $
,**$ %
udp**& )
.**) *

IsExternal*** 4
.**4 5
ToString**5 =
(**= >
)**> ?
)**? @
,**@ A
new++ 
Claim++ 
(++ 
$str++ !
,++! "
udp++# &
.++& '
IsAdministrator++' 6
.++6 7
ToString++7 ?
(++? @
)++@ A
)++A B
},, 
;,, 
context-- 
.-- 
IssuedClaims--  
=--! "
claims--# )
;--) *
}.. 	
public00 
async00 
Task00 
IsActiveAsync00 '
(00' (
IsActiveContext00( 7
context008 ?
)00? @
{11 	
await22 
Task22 
.22 
Run22 
(22 
(22 
)22 
=>22  
{22! "
context33 
.33 
IsActive33  
=33! "
true33# '
;33' (
}44 
)44 
;44 
}66 	
}77 
}88 ”
ëC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Security.API\_Code\CustomIdentity\CustomResourceOwnerPasswordValidator.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Security "
." #
API# &
.& '
CustomIdentity' 5
{ 
public 

class 0
$CustomResourceOwnerPasswordValidator 5
:6 7+
IResourceOwnerPasswordValidator8 W
{		 
private

 
readonly

 %
IAuthenticationAppService

 2%
_authenticationAppService

3 L
;

L M
public 0
$CustomResourceOwnerPasswordValidator 3
(3 4%
IAuthenticationAppService4 M$
authenticationAppServiceN f
)f g
{ 	%
_authenticationAppService %
=& '$
authenticationAppService( @
;@ A
} 	
public 
Task 
ValidateAsync !
(! "2
&ResourceOwnerPasswordValidationContext" H
contextI P
)P Q
{ 	
if 
( %
_authenticationAppService )
.) *
ValidateUser* 6
(6 7
context7 >
.> ?
UserName? G
,G H
contextI P
.P Q
PasswordQ Y
)Y Z
)Z [
{ 
context 
. 
Result 
=  
new! $!
GrantValidationResult% :
(: ;
context; B
.B C
UserNameC K
,K L
OidcConstantsM Z
.Z [!
AuthenticationMethods[ p
.p q
Passwordq y
)y z
;z {
} 
return 
Task 
. 

FromResult "
(" #
$num# $
)$ %
;% &
} 	
} 
} ú
wC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Security.API\_Code\CustomIdentity\CustomUser.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Security "
." #
API# &
.& '
CustomIdentity' 5
{ 
public 

class 

CustomUser 
{ 
public 
string 
	SubjectId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
}		 
}

 à	
C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Security.API\_Code\CustomIdentity\IdentityExtensions.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Security "
." #
API# &
.& '
CustomIdentity' 5
{ 
public 

static 
class 1
%CustomIdentityServerBuilderExtensions =
{ 
public 
static "
IIdentityServerBuilder ,
AddCustomUserStore- ?
(? @
this@ D"
IIdentityServerBuilderE [
builder\ c
)c d
{ 	
builder		 
.		 
AddProfileService		 %
<		% & 
CustomProfileService		& :
>		: ;
(		; <
)		< =
;		= >
builder

 
.

 %
AddResourceOwnerValidator

 -
<

- .0
$CustomResourceOwnerPasswordValidator

. R
>

R S
(

S T
)

T U
;

U V
return 
builder 
; 
} 	
} 
} £
xC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Security.API\_Code\ExceptionHandling\ApiError.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Security "
." #
API# &
.& '
_Code' ,
., -
ExceptionHandling- >
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
public 
string 
detail 
{ 
get "
;" #
set$ '
;' (
}) *
public 
ApiError 
( 
string 
message &
)& '
{ 	
this 
. 
message 
= 
message "
;" #
} 	
public 
ApiError 
(  
ModelStateDictionary ,

modelState- 7
)7 8
{ 	
if 
( 

modelState 
!= 
null "
&&# %

modelState& 0
.0 1
Any1 4
(4 5
m5 6
=>7 9
m: ;
.; <
Value< A
.A B
ErrorsB H
.H I
CountI N
>O P
$numQ R
)R S
)S T
{ 
message 
= 
$str N
;N O
}!! 
}"" 	
}## 
}$$ ∆
|C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Security.API\_Code\ExceptionHandling\ApiException.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Security "
." #
API# &
.& '
_Code' ,
., -
ExceptionHandling- >
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
public 
ApiException 
( 
	Exception %
ex& (
,( )
int* -

statusCode. 8
=9 :
$num; >
)> ?
:@ A
baseB F
(F G
exG I
.I J
MessageJ Q
)Q R
{ 	

StatusCode 
= 

statusCode #
;# $
} 	
} 
} ‘
ÖC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Security.API\_Code\ExceptionHandling\ApiExceptionExtension.cs
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
 
Security

 "
.

" #
API

# &
.

& '
_Code

' ,
.

, -
ExceptionHandling

- >
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
}// ’1
ÇC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Security.API\_Code\ExceptionHandling\ApiExceptionFilter.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Security "
." #
API# &
.& '
_Code' ,
., -
ExceptionHandling- >
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
context$$ 
.$$ 
HttpContext$$ #
.$$# $
Response$$$ ,
.$$, -

StatusCode$$- 7
=$$8 9
ex$$: <
.$$< =

StatusCode$$= G
;$$G H
_Logger&& 
.&& 

LogWarning&& "
(&&" #
$"&&# %&
Application thrown error: &&% ?
{&&? @
ex&&@ B
.&&B C
Message&&C J
}&&J K
"&&K L
,&&L M
ex&&N P
)&&P Q
;&&Q R
}'' 
else(( 
if(( 
((( 
context(( 
.(( 
	Exception(( &
is((' )'
UnauthorizedAccessException((* E
)((E F
{)) 
apiError** 
=** 
new** 
ApiError** '
(**' (
$str**( =
)**= >
;**> ?
context++ 
.++ 
HttpContext++ #
.++# $
Response++$ ,
.++, -

StatusCode++- 7
=++8 9
$num++: =
;++= >
_Logger,, 
.,, 

LogWarning,, "
(,," #
$str,,# N
),,N O
;,,O P
}-- 
else.. 
if.. 
(.. 
context.. 
... 
	Exception.. &
is..' )
DominioException..* :
)..: ;
{// 
var00 
ex00 
=00 
context00  
.00  !
	Exception00! *
as00+ -
DominioException00. >
;00> ?
context11 
.11 
	Exception11 !
=11" #
null11$ (
;11( )
baseResponse33 
=33 
new33 "
BaseResponse33# /
(33/ 0
)330 1
;331 2
baseResponse44 
.44 
StateResponse44 *
.44* +
HasError44+ 3
=444 5
true446 :
;44: ;
baseResponse55 
.55 
StateResponse55 *
.55* +
	TipoError55+ 4
=555 6
	Constants557 @
.55@ A
	TipoError55A J
.55J K
DOMINIO55K R
;55R S
baseResponse66 
.66 
StateResponse66 *
.66* +
MensajeError66+ 7
=668 9
ex66: <
.66< =
Message66= D
;66D E
context88 
.88 
ExceptionHandled88 (
=88) *
true88+ /
;88/ 0
}99 
else:: 
{;; 
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