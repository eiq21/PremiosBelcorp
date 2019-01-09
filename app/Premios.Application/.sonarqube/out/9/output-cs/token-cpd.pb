Â
yC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Domain.Context\SecurityModule\ISecurityService.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Domain  
.  !
Context! (
.( )
SecurityModule) 7
{ 
public 

	interface 
ISecurityService %
{ 
bool		 
IsAdministrator		 
(		 
string		 #
username		$ ,
)		, -
;		- .
} 
} ž
xC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Domain.Context\SecurityModule\SecurityService.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Domain  
.  !
Context! (
.( )
SecurityModule) 7
{ 
public 

class 
SecurityService  
:! "
ISecurityService# 3
{		 
public

 
SecurityService

 
(

 

ILDAPAgent

 )
	ldapAgent

* 3
)

3 4
{ 	
} 	
public 
bool 
IsAdministrator #
(# $
string$ *
username+ 3
)3 4
{ 	
throw 
new #
NotImplementedException -
(- .
). /
;/ 0
} 	
} 
} 