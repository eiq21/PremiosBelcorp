¿
sC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\Campaign.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
Campaign 
{ 
public		 
int		 

CampaignId		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public

 
string

 
Description

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
bool 
Active 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
CreatedUser !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
CreatedDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
LastModifiedUser &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DateTime 
? 
LastModifiedDate )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
ICollection 
< 
CampaignUrl &
>& '
CampaignUrls( 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
ICollection 
< 
Team 
>  
Team! %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ‡
vC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\CampaignUrl.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
CampaignUrl 
{ 
public		 
int		 
CampaignUrlId		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public

 
int

 

CampaignId
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
public 
int 
	TypeUrlId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 

Sequential 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
ValueUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
Actived 
{ 
get !
;! "
set# &
;& '
}( )
public 
bool 
Deleted 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
CreatedUser !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
CreatedDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
LastModifiedUser &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DateTime 
? 
LastModifiedDate )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
Campaign 
Campaign  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
TypeUrl 
TypeUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Î
yC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\ChangePassword.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
ChangePassword 
{ 
public		 
bool		 
Status		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Message

 
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
* +
} 
} ß
uC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\CustomFile.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 

CustomFile 
{ 
public		 
byte		 
[		 
]		 
FileContents		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public

 
string

 
ContentType

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
string 
FileName 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} â
wC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\DetailByTeam.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
DetailByTeam 
{ 
public 
int 
TeamId 
{ 
get 
;  
set! $
;$ %
}& '
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Synopsis

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
string 
Protagonists "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
ValueUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
? 

VotationId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
? 
Vote 
{ 
get 
; 
set  #
;# $
}% &
} 
} Â
ÅC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\GetUserDetailParameter.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class "
GetUserDetailParameter '
{ 
public		 
string		 
UserName		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
}

 
} »
yC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\ImportCampaign.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
ImportCampaign 
{ 
public		 
int		 

CampaniaId		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public

 
string

 
Descripcion

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
public 
bool 
	Eliminado 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
UsuarioCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
UsuarioModificacion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DateTime 
? 
FechaModificacion *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
} 
} Ñ
|C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\ImportCampaignUrl.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
ImportCampaignUrl "
{ 
public		 
int		 

CampaniaId		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public

 
int

 
	TipoUrlId

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
string 
ValorUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Descripcion !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
public 
bool 
	Eliminado 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
UsuarioCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
UsuarioModificacion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DateTime 
? 
FechaModificacion *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
} 
} °
uC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\ImportTeam.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 

ImportTeam 
{ 
public 
int 
EquipoId 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 

CampaniaId 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
string		 
Nombre		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 
string

 
Descripcion

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
string 
Sinopsis 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Protagonistas #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
public 
bool 
	Eliminado 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
UsuarioCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
UsuarioModificacion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DateTime 
FechaModificacion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} ô
xC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\ImportTeamUrl.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
ImportTeamUrl 
{ 
public		 
int		 
EquipoId		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
int

 
	TipoUrlId

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
string 
ValorUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
UsuarioCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
UsuarioModificacion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DateTime 
FechaModificacion )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} Å
yC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\InsertVotation.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
InsertVotation 
{ 
public 
int 
TeamId 
{ 
get 
;  
set! $
;$ %
}& '
public		 
string		 
UserCode		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
int

 
Value

 
{

 
get

 
;

 
set

  #
;

# $
}

% &
} 
} ˛
åC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\ListCampaignByPageFilterParameter.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class -
!ListCampaignByPageFilterParameter 2
{ 
public		 
string		 
Description		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
}

 
} Î
yC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\PagedParameter.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
PagedParameter 
{ 
public		 
int		 
	PageIndex		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 
int

 
PageSize

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
} 
} ‡

xC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\RankingReport.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
RankingReport 
{ 
public 
int 
EquipoId 
{ 
get !
;! "
set# &
;& '
}( )
public		 
string		 
NombreHistoria		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
public

 
string

 
URL

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
public 
int 
NumeroPersonas !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 
Promedio 
{  !
get" %
;% &
set' *
;* +
}, -
public 
decimal 
Puntaje 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ú
vC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\Suggestions.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
Suggestions 
{ 
public 
int 
TeamId 
{ 
get 
;  
set! $
;$ %
}& '
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Description

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
string 
ValueUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ≤
oC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\Team.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
Team 
{ 
public		 
int		 
TeamId		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
public

 
int

 

CampaignId
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
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Synopsis 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Protagonists "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
bool 
Actived 
{ 
get !
;! "
set# &
;& '
}( )
public 
bool 
Deleted 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
CreatedUser !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
CreatedDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
LastModifiedUser &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DateTime 
? 
LastModifiedDate )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
Campaign 
Campaign  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} ‹
rC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\TeamUrl.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
TeamUrl 
{ 
public		 
int		 
	TeamUrlId		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 
int

 
TeamId

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
public 
int 
	TypeUrlId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
ValueUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
CreatedUser !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
CreatedDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
LastModifiedUser &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DateTime 
? 
LastModifiedDate )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
Team 
Team 
{ 
get 
; 
set  #
;# $
}% &
public 
TypeUrl 
TypeUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} å
pC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\Tiles.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
Tiles 
{ 
public		 
int		 
	TeamUrlId		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 
int

 
TeamId

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
public 
int 
	TypeUrlId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 

Sequential 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string  
VideoPreviewValueUrl *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
string 
ImageValueUrl #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} Ÿ
rC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\TypeUrl.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
TypeUrl 
{ 
public		 
int		 
	TypeUrlId		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
bool 
Actived 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 

Sequential 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
CreatedUser !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
CreatedDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
LastModifiedUser &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DateTime 
? 
LastModifiedDate )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
ICollection 
< 
CampaignUrl &
>& '
CampaignUrls( 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
ICollection 
< 
TeamUrl "
>" #
TeamUrls$ ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
} 
} ú
yC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\UpdateVotation.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
UpdateVotation 
{ 
public 
int 

VotationId 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
int		 
TeamId		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
public

 
string

 
UserCode

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
int 
Value 
{ 
get 
; 
set  #
;# $
}% &
} 
} Ç
yC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\UploadCampaign.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
UploadCampaign 
{		 
public

 
	DataTable

 
DataCampania

 %
{

& '
get

( +
;

+ ,
set

- 0
;

0 1
}

2 3
public 
	DataTable 
DataCampaniaUrls )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} Ô
{C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\UploadFileResult.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
UploadFileResult !
{ 
public		 
bool		 
Status		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Message

 
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
* +
} 
} ˜
uC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\UploadTeam.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 

UploadTeam 
{		 
public

 
	DataTable

 

DataEquipo

 #
{

$ %
get

& )
;

) *
set

+ .
;

. /
}

0 1
public 
	DataTable 
DataEquiposUrls (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} ‘
}C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\UploadUserExternal.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
UploadUserExternal #
{ 
public		 
int		 
IdTrabajador		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public

 
string

 
NombreCompleto

 $
{

% &
get

' *
;

* +
set

, /
;

/ 0
}

1 2
public 
string 
NroDocumento "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
byte 
[ 
] 
Clave 
{ 
get !
;! "
set# &
;& '
}( )
} 
} Â
ÜC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\UploadUserExternalParameter.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class '
UploadUserExternalParameter ,
{		 
public

 
	DataTable

 
DataUsuarioExterno

 +
{

, -
get

. 1
;

1 2
set

3 6
;

6 7
}

8 9
public 
string 
UsuarioProceso $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
DateTime 
FechaProceso $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
bool 
EliminaDatoAnterior '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
} Ø
|C:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\UserDetailProfile.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
UserDetailProfile "
{ 
public		 
string		 
UserCode		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
bool 
IsAdministrator #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
bool 

IsExternal 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} €
wC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\UserExternal.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
UserExternal 
{ 
public		 
int		 
UserExternalId		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

 
string

 
DocumentNumber

 $
{

% &
get

' *
;

* +
set

, /
;

/ 0
}

1 2
public 
string 
Names 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
bool 
Active 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
CreatedUser !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
CreatedDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
LastModifiedUser &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DateTime 
? 
LastModifiedDate )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} ©
sC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.CrossCutting.DTO\Votation.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
CrossCutting) 5
.5 6
DTO6 9
{ 
public 

class 
Votation 
{ 
public		 
int		 

VotationId		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public

 
int

 
TeamId

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
public 
string 
UserCode 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
Value 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
CreatedUser !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
CreatedDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
LastModifiedUser &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DateTime 
? 
LastModifiedDate )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
} 
} 