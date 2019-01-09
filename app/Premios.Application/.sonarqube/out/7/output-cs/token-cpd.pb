√
îC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\AuthenticationModule\Request\ValidateUserRequest.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3 
AuthenticationModule3 G
.G H
RequestH O
{ 
public 

class 
ValidateUserRequest $
{ 
public

 
string

 
Username
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
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} …
ñC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\AuthenticationModule\Response\ValidateUserResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3 
AuthenticationModule3 G
.G H
ResponseH P
{ 
public 

class  
ValidateUserResponse %
{ 
public

 
string

 
Token

 
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
( )
public 
bool 
isAuthenticated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} Õ
wC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\Common\BaseResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
Common3 9
{ 
public 

class 
BaseResponse 
{ 
public		 
BaseResponse		 
(		 
)		 
{

 	
StateResponse 
= 
new 
BaseResponseDTO  /
(/ 0
)0 1
;1 2
} 	
public 
BaseResponseDTO 
StateResponse ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
} 
} º
zC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\Common\BaseResponseDTO.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
Common3 9
{ 
public 

class 
BaseResponseDTO  
{ 
public		 
bool		 
HasError		 
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
 
?

 
CodigoError

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
string 
	TipoError 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
MensajeError "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} ß
ìC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Request\CampaignInsertRequest.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
RequestE L
{ 
public 

class !
CampaignInsertRequest &
{		 
public

 
Campaign

 
Campaign

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
} 
} ß
ìC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Request\InsertCampaignRequest.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
RequestE L
{ 
public 

class !
InsertCampaignRequest &
{		 
public

 
Campaign

 
Campaign

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
} 
} “
ìC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Request\InsertVotationRequest.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
RequestE L
{ 
public 

class !
InsertVotationRequest &
{		 
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
}% &
} 
} ≤
öC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Request\ListBannersByCampaignRequest.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
RequestE L
{ 
public 

class (
ListBannersByCampaignRequest -
{		 
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
* +
} 
} ã
óC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Request\ListCampaignByPageRequest.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
RequestE L
{ 
public 

class %
ListCampaignByPageRequest *
{		 
public

 -
!ListCampaignByPageFilterParameter

 0-
!ListCampaignByPageFilterParameter

1 R
{

S T
get

U X
;

X Y
set

Z ]
;

] ^
}

_ `
public 
PagedParameter 
PagedParameter ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
} 
} ¿
ïC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Request\ListDetailByTeamRequest.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
RequestE L
{ 
public 

class #
ListDetailByTeamRequest (
{		 
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
CodeUser 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} •
ìC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Request\ListSuggetionsRequest.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
RequestE L
{ 
public 

class !
ListSuggetionsRequest &
{		 
public

 
string

 
CodeUser
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
+ ,
} 
} Ì
ìC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Request\UpdateVotationRequest.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
RequestE L
{ 
public 

class !
UpdateVotationRequest &
{		 
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
public 
int 

VotationId 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} ´
ïC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Response\CampaignInsertResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
ResponseE M
{ 
public 

class "
CampaignInsertResponse '
{		 
public

 
Campaign

 
Campaign

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
} 
} ’
îC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Response\ExportRankingResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
ResponseE M
{		 
public

 

class

 !
ExportRankingResponse

 &
:

' (
BaseResponse

) 5
{ 
public 

CustomFile 
	ExcelFile #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ´
ïC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Response\InsertCampaignResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
ResponseE M
{ 
public 

class "
InsertCampaignResponse '
{		 
public

 
Campaign

 
Campaign

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
} 
} ‘
ïC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Response\InsertVotationResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
ResponseE M
{ 
public		 

class		 "
InsertVotationResponse		 '
:		( )
BaseResponse		* 6
{

 
public 
Votation 
Votation  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} …
úC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Response\ListBannersByCampaignResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
ResponseE M
{ 
public		 

class		 )
ListBannersByCampaignResponse		 .
:		/ 0
BaseResponse		1 =
{

 
public 
ICollection 
< 
CampaignUrl &
>& '
CampaignUrl( 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public )
ListBannersByCampaignResponse ,
(, -
)- .
{ 	
CampaignUrl 
= 
new 
List "
<" #
CampaignUrl# .
>. /
(/ 0
)0 1
;1 2
} 	
} 
} Í
ôC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Response\ListCampaignByPageResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
ResponseE M
{ 
public		 

class		 &
ListCampaignByPageResponse		 +
{

 
public 

IPagedList 
< 
Campaign "
>" #
	Campaigns$ -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
} 
} †
ëC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Response\ListDetailResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
ResponseE M
{ 
public		 

class		 
ListDetailResponse		 #
:		$ %
BaseResponse		& 2
{

 
public 
ICollection 
< 
DetailByTeam '
>' (
Detail) /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
ListDetailResponse !
(! "
)" #
{ 	
Detail 
= 
new 
List 
< 
DetailByTeam *
>* +
(+ ,
), -
;- .
} 	
} 
} ∑
ñC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Response\ListSuggestionsResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
ResponseE M
{ 
public		 

class		 #
ListSuggestionsResponse		 (
:		) *
BaseResponse		+ 7
{

 
public 
ICollection 
< 
Suggestions &
>& '
Suggestions( 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public #
ListSuggestionsResponse &
(& '
)' (
{ 	
Suggestions 
= 
new 
List "
<" #
Suggestions# .
>. /
(/ 0
)0 1
;1 2
} 	
} 
} ç
êC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Response\ListTilesResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
ResponseE M
{ 
public		 

class		 
ListTilesResponse		 "
:		# $
BaseResponse		% 1
{

 
public 
ICollection 
< 
Tiles  
>  !
Tiles" '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
ListTilesResponse  
(  !
)! "
{ 	
Tiles 
= 
new 
List 
< 
Tiles "
>" #
(# $
)$ %
;% &
} 	
} 
} ‘
ïC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Response\UpdateVotationResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
ResponseE M
{ 
public		 

class		 "
UpdateVotationResponse		 '
:		( )
BaseResponse		* 6
{

 
public 
Votation 
Votation  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} æ
ëC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\MaintenanceModule\Response\UploadFileResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
MaintenanceModule3 D
.D E
ResponseE M
{ 
public		 

class		 
UploadFileResponse		 #
:		$ %
BaseResponse		& 2
{

 
public 
ICollection 
< 
UploadFileResult +
>+ ,
UploadFilesResult- >
{? @
getA D
;D E
setF I
;I J
}K L
public 
UploadFileResponse !
(! "
)" #
{ 	
UploadFilesResult 
= 
new  #
List$ (
<( )
UploadFileResult) 9
>9 :
(: ;
); <
;< =
} 	
} 
} ¬
íC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\UseerModule\Request\ChangePasswordAdminRequest.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
UseerModule3 >
.> ?
Request? F
{ 
public 

class &
ChangePasswordAdminRequest +
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
 
PasswordNew
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
. /
} 
} ◊
çC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\UseerModule\Request\ChangePasswordRequest.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
UseerModule3 >
.> ?
Request? F
{ 
public 

class !
ChangePasswordRequest &
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
 
PasswordOld
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
string 
PasswordNew !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ó
åC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\UseerModule\Request\GetUserDetailRequest.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
UseerModule3 >
.> ?
Request? F
{ 
public 

class  
GetUserDetailRequest %
{ 
public		 
string		 
UserCode		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
}

 
} ¥
èC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\UseerModule\Response\ChangePasswordResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
UseerModule3 >
.> ?
Response? G
{ 
public		 

class		 "
ChangePasswordResponse		 '
:		( )
BaseResponse		* 6
{

 
public 
ICollection 
< 
ChangePassword )
>) *
ChangePassword+ 9
{: ;
get< ?
;? @
setA D
;D E
}F G
public "
ChangePasswordResponse %
(% &
)& '
{ 	
ChangePassword 
= 
new  
List! %
<% &
ChangePassword& 4
>4 5
(5 6
)6 7
;7 8
} 	
} 
} ÿ
éC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Transport\UseerModule\Response\GetUserDetailResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
	Transport) 2
.2 3
UseerModule3 >
.> ?
Response? G
{ 
public		 

class		 !
GetUserDetailResponse		 &
:		' (
BaseResponse		) 5
{

 
public 
UserDetailProfile  
UserDetailProfile! 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
} 