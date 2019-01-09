”
yC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Security\CORS\SecurityExtension.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Security) 1
.1 2
CORS2 6
{		 
public

 

static

 
class

 
SecurityExtension

 )
{ 
public 
static 
IServiceCollection (
AddSecurity) 4
(4 5
this5 9
IServiceCollection: L
servicesM U
,U V
IConfigurationW e
configurationf s
)s t
{ 	
services 
. 
AddCors 
( 
options $
=>% '
{ 
options 
. 
	AddPolicy !
(! "
$str" 0
,0 1
builder 
=> 
{ 
builder 
. 
AllowAnyOrigin '
(' (
)( )
. 
AllowAnyMethod '
(' (
)( )
. 
AllowAnyHeader '
(' (
)( )
. 
AllowCredentials )
() *
)* +
;+ ,
} 
) 
; 
} 
) 
; 
return 
services 
; 
} 	
public 
static 
IApplicationBuilder )
UseAllowAllCORS* 9
(9 :
this: >
IApplicationBuilder? R
appS V
)V W
{ 	
if   
(   
app   
==   
null   
)   
{!! 
throw"" 
new"" !
ArgumentNullException"" /
(""/ 0
nameof""0 6
(""6 7
app""7 :
)"": ;
)""; <
;""< =
}## 
return%% 
app%% 
.%% 
UseCors%% 
(%% 
$str%% -
)%%- .
;%%. /
}&& 	
}(( 
})) 