Í
tC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Core\Adapters\CampaignAdapter.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Application %
.% &
Core& *
.* +
Adapters+ 3
{ 
public		 

class		 
CampaignAdapter		  
:		! "
ICampaignAdapter		# 3
{

 
public 
Campaign "
FromCampaniaToCampaign .
(. /
Campania/ 7
campania8 @
)@ A
{ 	
if 
( 
campania 
== 
null  
)  !
{ 
return 
null 
; 
} 
return 
new 
Campaign 
(  
)  !
{" #

CampaignId 
= 
campania %
.% &

CampaniaId& 0
,0 1
Description 
= 
campania &
.& '
Descripcion' 2
,2 3
Active 
= 
campania !
.! "
Activo" (
} 
; 
} 	
public 
Campania "
FromCampaignToCampania .
(. /
Campaign/ 7
campaign8 @
)@ A
{ 	
if 
( 
campaign 
== 
null  
)  !
{ 
return 
null 
; 
}   
return"" 
new"" 
Campania"" 
(""  
)""  !
{## 

CampaniaId$$ 
=$$ 
campaign$$ %
.$$% &

CampaignId$$& 0
,$$0 1
Descripcion%% 
=%% 
campaign%% &
.%%& '
Description%%' 2
,%%2 3
Activo&& 
=&& 
campaign&& !
.&&! "
Active&&" (
}'' 
;'' 
}(( 	
})) 
}** Ú
uC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Application.Core\Adapters\ICampaignAdapter.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Application %
.% &
Core& *
.* +
Adapters+ 3
{ 
public		 

	interface		 
ICampaignAdapter		 %
{

 
Campaign "
FromCampaniaToCampaign '
(' (
Campania( 0
campania1 9
)9 :
;: ;
Campania "
FromCampaignToCampania '
(' (
Campaign( 0
campaign1 9
)9 :
;: ;
} 
} 