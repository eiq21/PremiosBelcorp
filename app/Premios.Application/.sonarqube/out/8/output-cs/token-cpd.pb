ﬂö
yC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Agents\ClosedXML\ClosedXMLAgent.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Agents) /
./ 0
	ClosedXML0 9
{ 
public 

class 
ClosedXMLAgent 
:  !
IClosedXMLAgent" 1
{ 
public "
ImportCampaignResponse %
ImportCampaign& 4
(4 5!
ImportCampaignRequest5 J!
importCampaignRequestK `
,` a
stringb h
userNamei q
)q r
{ 	
List 
< 
ImportCampaign 
>  
lstCampaign! ,
=- .
new/ 2
List3 7
<7 8
ImportCampaign8 F
>F G
(G H
)H I
;I J
List 
< 
ImportCampaignUrl "
>" #
lstCampaignUrls$ 3
=4 5
new6 9
List: >
<> ?
ImportCampaignUrl? P
>P Q
(Q R
)R S
;S T
ImportCampaign 
objCampaign &
=' (
null) -
;- .
ImportCampaignUrl 
objCampaignUrl ,
=- .
null/ 3
;3 4
var 
file 
= !
importCampaignRequest ,
., -
file- 1
;1 2
var 

wkCampaign 
= 
new  

XLWorkbook! +
(+ ,
file, 0
.0 1
OpenReadStream1 ?
(? @
)@ A
)A B
;B C
var 

wsCampania 
= 

wkCampaign '
.' (
	Worksheet( 1
(1 2
$num2 3
)3 4
;4 5
	DataTable   

dtCampania    
=  ! "

wsCampania  # -
.  - .
	RangeUsed  . 7
(  7 8
)  8 9
.  9 :
AsTable  : A
(  A B
)  B C
.  C D
AsNativeDataTable  D U
(  U V
)  V W
;  W X
objCampaign"" 
="" 
new"" 
ImportCampaign"" ,
("", -
)""- .
;"". /
objCampaign## 
.## 

CampaniaId## "
=### $
Convert##% ,
.##, -
ToInt32##- 4
(##4 5

dtCampania##5 ?
.##? @
Rows##@ D
[##D E
$num##E F
]##F G
.##G H
	ItemArray##H Q
.##Q R
GetValue##R Z
(##Z [
$num##[ \
)##\ ]
)##] ^
;##^ _
objCampaign$$ 
.$$ 
Descripcion$$ #
=$$$ %

dtCampania$$& 0
.$$0 1
Rows$$1 5
[$$5 6
$num$$6 7
]$$7 8
.$$8 9
	ItemArray$$9 B
.$$B C
GetValue$$C K
($$K L
$num$$L M
)$$M N
.$$N O
ToString$$O W
($$W X
)$$X Y
;$$Y Z
objCampaign%% 
.%% 
UsuarioCreacion%% '
=%%( )
userName%%* 2
;%%2 3
objCampaign&& 
.&& 
FechaCreacion&& %
=&&& '
DateTime&&( 0
.&&0 1
Now&&1 4
;&&4 5
objCampaign'' 
.'' 
UsuarioModificacion'' +
='', -
userName''. 6
;''6 7
objCampaign(( 
.(( 
FechaModificacion(( )
=((* +
DateTime((, 4
.((4 5
Now((5 8
;((8 9
lstCampaign++ 
.++ 
Add++ 
(++ 
objCampaign++ '
)++' (
;++( )
var// 
wsCampaniaUrl// 
=// 

wkCampaign//  *
.//* +
	Worksheet//+ 4
(//4 5
$num//5 6
)//6 7
;//7 8
	DataTable11 
dtCampaniaUrl11 #
=11$ %
wsCampaniaUrl11& 3
.113 4
	RangeUsed114 =
(11= >
)11> ?
.11? @
AsTable11@ G
(11G H
)11H I
.11I J
AsNativeDataTable11J [
(11[ \
)11\ ]
;11] ^
foreach33 
(33 
DataRow33 
row33  
in33! #
dtCampaniaUrl33$ 1
.331 2
Rows332 6
)336 7
{44 
var66 
	nombreUrl66 
=66 
row66  #
.66# $
	ItemArray66$ -
.66- .
GetValue66. 6
(666 7
$num667 8
)668 9
.669 :
ToString66: B
(66B C
)66C D
;66D E
int77 

secuencial77 
=77  
$num77! "
;77" #
if88 
(88 
	nombreUrl88 
==88  
$str88! 9
)889 :
{99 

secuencial:: 
=::  
$num::! "
;::" #
};; 
else<< 
if<< 
(<< 
	nombreUrl<< "
==<<# %
$str<<& S
)<<S T
{== 

secuencial>> 
=>>  
$num>>! "
;>>" #
}?? 
else@@ 
if@@ 
(@@ 
	nombreUrl@@ "
==@@# %
$str@@& L
)@@L M
{AA 

secuencialBB 
=BB  
$numBB! "
;BB" #
}CC 
elseDD 
ifDD 
(DD 
	nombreUrlDD "
==DD# %
$strDD& @
)DD@ A
{EE 

secuencialFF 
=FF  
$numFF! "
;FF" #
}GG 
elseHH 
{HH 

secuencialII 
=II  
$numII! "
;II" #
}JJ 
objCampaignUrlMM 
=MM  
newMM! $
ImportCampaignUrlMM% 6
(MM6 7
)MM7 8
;MM8 9
objCampaignUrlNN 
.NN 

CampaniaIdNN )
=NN* +
ConvertNN, 3
.NN3 4
ToInt32NN4 ;
(NN; <
rowNN< ?
.NN? @
	ItemArrayNN@ I
.NNI J
GetValueNNJ R
(NNR S
$numNNS T
)NNT U
)NNU V
;NNV W
objCampaignUrlOO 
.OO 
	TipoUrlIdOO (
=OO) *

secuencialOO+ 5
;OO5 6
objCampaignUrlPP 
.PP 
ValorUrlPP '
=PP( )
rowPP* -
.PP- .
	ItemArrayPP. 7
.PP7 8
GetValuePP8 @
(PP@ A
$numPPA B
)PPB C
.PPC D
ToStringPPD L
(PPL M
)PPM N
;PPN O
objCampaignUrlQQ 
.QQ 
DescripcionQQ *
=QQ+ ,
rowQQ- 0
.QQ0 1
	ItemArrayQQ1 :
.QQ: ;
GetValueQQ; C
(QQC D
$numQQD E
)QQE F
.QQF G
ToStringQQG O
(QQO P
)QQP Q
;QQQ R
objCampaignUrlRR 
.RR 
ActivoRR %
=RR& '
trueRR( ,
;RR, -
objCampaignUrlSS 
.SS 
	EliminadoSS (
=SS) *
falseSS+ 0
;SS0 1
objCampaignUrlTT 
.TT 
UsuarioCreacionTT .
=TT/ 0
userNameTT1 9
;TT9 :
objCampaignUrlUU 
.UU 
FechaCreacionUU ,
=UU- .
DateTimeUU/ 7
.UU7 8
NowUU8 ;
;UU; <
objCampaignUrlVV 
.VV 
UsuarioModificacionVV 2
=VV3 4
userNameVV5 =
;VV= >
objCampaignUrlWW 
.WW 
FechaModificacionWW 0
=WW1 2
DateTimeWW3 ;
.WW; <
NowWW< ?
;WW? @
lstCampaignUrlsYY 
.YY  
AddYY  #
(YY# $
objCampaignUrlYY$ 2
)YY2 3
;YY3 4
}ZZ 
return^^ 
new^^ "
ImportCampaignResponse^^ -
(^^- .
)^^. /
{__ 
	Campaigns`` 
=`` 
lstCampaign`` '
,``' (
CampaignUrlsaa 
=aa 
lstCampaignUrlsaa .
}bb 
;bb 
}cc 	
publicee 
ImportTeamResponseee !

ImportTeamee" ,
(ee, -
ImportTeamRequestee- >
importTeamRequestee? P
,eeP Q
stringeeR X
userNameeeY a
)eea b
{ff 	
Listgg 
<gg 

ImportTeamgg 
>gg 
lstTeamgg $
=gg% &
newgg' *
Listgg+ /
<gg/ 0

ImportTeamgg0 :
>gg: ;
(gg; <
)gg< =
;gg= >
Listhh 
<hh 
ImportTeamUrlhh 
>hh 
lstTeamUrlshh  +
=hh, -
newhh. 1
Listhh2 6
<hh6 7
ImportTeamUrlhh7 D
>hhD E
(hhE F
)hhF G
;hhG H

ImportTeamjj 
objTeamjj 
=jj  
nulljj! %
;jj% &
ImportTeamUrlkk 

objTeamUrlkk $
=kk% &
nullkk' +
;kk+ ,
varll 
filell 
=ll 
importTeamRequestll (
.ll( )
filell) -
;ll- .
varmm 
wkTeammm 
=mm 
newmm 

XLWorkbookmm '
(mm' (
filemm( ,
.mm, -
OpenReadStreammm- ;
(mm; <
)mm< =
)mm= >
;mm> ?
varpp 

wsCampaniapp 
=pp 
wkTeampp #
.pp# $
	Worksheetpp$ -
(pp- .
$numpp. /
)pp/ 0
;pp0 1
	DataTablerr 
dtTeamrr 
=rr 

wsCampaniarr )
.rr) *
	RangeUsedrr* 3
(rr3 4
)rr4 5
.rr5 6
AsTablerr6 =
(rr= >
)rr> ?
.rr? @
AsNativeDataTablerr@ Q
(rrQ R
)rrR S
;rrS T
foreachss 
(ss 
DataRowss 
rowss  
inss! #
dtTeamss$ *
.ss* +
Rowsss+ /
)ss/ 0
{tt 
objTeamuu 
=uu 
newuu 

ImportTeamuu (
(uu( )
)uu) *
;uu* +
objTeamvv 
.vv 
EquipoIdvv  
=vv! "
Convertvv# *
.vv* +
ToInt32vv+ 2
(vv2 3
rowvv3 6
.vv6 7
	ItemArrayvv7 @
.vv@ A
GetValuevvA I
(vvI J
$numvvJ K
)vvK L
)vvL M
;vvM N
objTeamww 
.ww 

CampaniaIdww "
=ww# $
Convertww% ,
.ww, -
ToInt32ww- 4
(ww4 5
rowww5 8
.ww8 9
	ItemArrayww9 B
.wwB C
GetValuewwC K
(wwK L
$numwwL M
)wwM N
)wwN O
;wwO P
objTeamxx 
.xx 
Nombrexx 
=xx  
rowxx! $
.xx$ %
	ItemArrayxx% .
.xx. /
GetValuexx/ 7
(xx7 8
$numxx8 9
)xx9 :
.xx: ;
ToStringxx; C
(xxC D
)xxD E
;xxE F
objTeamyy 
.yy 
Descripcionyy #
=yy$ %
rowyy& )
.yy) *
	ItemArrayyy* 3
.yy3 4
GetValueyy4 <
(yy< =
$numyy= >
)yy> ?
.yy? @
ToStringyy@ H
(yyH I
)yyI J
;yyJ K
objTeamzz 
.zz 
Sinopsiszz  
=zz! "
rowzz# &
.zz& '
	ItemArrayzz' 0
.zz0 1
GetValuezz1 9
(zz9 :
$numzz: ;
)zz; <
.zz< =
ToStringzz= E
(zzE F
)zzF G
;zzG H
objTeam{{ 
.{{ 
Protagonistas{{ %
={{& '
row{{( +
.{{+ ,
	ItemArray{{, 5
.{{5 6
GetValue{{6 >
({{> ?
$num{{? @
){{@ A
.{{A B
ToString{{B J
({{J K
){{K L
;{{L M
objTeam|| 
.|| 
Activo|| 
=||  
true||! %
;||% &
objTeam}} 
.}} 
	Eliminado}} !
=}}" #
false}}$ )
;}}) *
objTeam~~ 
.~~ 
UsuarioCreacion~~ '
=~~( )
userName~~* 2
;~~2 3
objTeam 
. 
FechaCreacion %
=& '
DateTime( 0
.0 1
Now1 4
;4 5
objTeam
ÄÄ 
.
ÄÄ !
UsuarioModificacion
ÄÄ +
=
ÄÄ, -
userName
ÄÄ. 6
;
ÄÄ6 7
objTeam
ÅÅ 
.
ÅÅ 
FechaModificacion
ÅÅ )
=
ÅÅ* +
DateTime
ÅÅ, 4
.
ÅÅ4 5
Now
ÅÅ5 8
;
ÅÅ8 9
lstTeam
ÉÉ 
.
ÉÉ 
Add
ÉÉ 
(
ÉÉ 
objTeam
ÉÉ #
)
ÉÉ# $
;
ÉÉ$ %
}
ÑÑ 
var
àà 
	wsTeamUrl
àà 
=
àà 
wkTeam
àà "
.
àà" #
	Worksheet
àà# ,
(
àà, -
$num
àà- .
)
àà. /
;
àà/ 0
	DataTable
ää 
	dtTeamUrl
ää 
=
ää  !
	wsTeamUrl
ää" +
.
ää+ ,
	RangeUsed
ää, 5
(
ää5 6
)
ää6 7
.
ää7 8
AsTable
ää8 ?
(
ää? @
)
ää@ A
.
ääA B
AsNativeDataTable
ääB S
(
ääS T
)
ääT U
;
ääU V
foreach
åå 
(
åå 
DataRow
åå 
row
åå  
in
åå! #
	dtTeamUrl
åå$ -
.
åå- .
Rows
åå. 2
)
åå2 3
{
çç 
var
èè 
	nombreUrl
èè 
=
èè 
row
èè  #
.
èè# $
	ItemArray
èè$ -
.
èè- .
GetValue
èè. 6
(
èè6 7
$num
èè7 8
)
èè8 9
.
èè9 :
ToString
èè: B
(
èèB C
)
èèC D
;
èèD E
int
êê 

secuencial
êê 
=
êê  
$num
êê! "
;
êê" #
if
ëë 
(
ëë 
	nombreUrl
ëë 
==
ëë  
$str
ëë! 5
)
ëë5 6
{
íí 

secuencial
ìì 
=
ìì  
$num
ìì! "
;
ìì" #
}
îî 
else
ïï 
if
ïï 
(
ïï 
	nombreUrl
ïï "
==
ïï# %
$str
ïï& 9
)
ïï9 :
{
ññ 

secuencial
óó 
=
óó  
$num
óó! "
;
óó" #
}
òò 
else
ôô 
if
ôô 
(
ôô 
	nombreUrl
ôô "
==
ôô# %
$str
ôô& A
)
ôôA B
{
öö 

secuencial
õõ 
=
õõ  
$num
õõ! "
;
õõ" #
}
úú 
else
ùù 
if
ùù 
(
ùù 
	nombreUrl
ùù "
==
ùù# %
$str
ùù& =
)
ùù= >
{
ûû 

secuencial
üü 
=
üü  
$num
üü! "
;
üü" #
}
†† 
else
°° 
{
¢¢ 

secuencial
££ 
=
££  
$num
££! "
;
££" #
}
§§ 

objTeamUrl
ßß 
=
ßß 
new
ßß  
ImportTeamUrl
ßß! .
(
ßß. /
)
ßß/ 0
;
ßß0 1

objTeamUrl
®® 
.
®® 
EquipoId
®® #
=
®®$ %
Convert
®®& -
.
®®- .
ToInt32
®®. 5
(
®®5 6
row
®®6 9
.
®®9 :
	ItemArray
®®: C
.
®®C D
GetValue
®®D L
(
®®L M
$num
®®M N
)
®®N O
)
®®O P
;
®®P Q

objTeamUrl
©© 
.
©© 
	TipoUrlId
©© $
=
©©% &

secuencial
©©' 1
;
©©1 2

objTeamUrl
™™ 
.
™™ 
ValorUrl
™™ #
=
™™$ %
row
™™& )
.
™™) *
	ItemArray
™™* 3
.
™™3 4
GetValue
™™4 <
(
™™< =
$num
™™= >
)
™™> ?
.
™™? @
ToString
™™@ H
(
™™H I
)
™™I J
;
™™J K

objTeamUrl
´´ 
.
´´ 
UsuarioCreacion
´´ *
=
´´+ ,
userName
´´- 5
;
´´5 6

objTeamUrl
¨¨ 
.
¨¨ 
FechaCreacion
¨¨ (
=
¨¨) *
DateTime
¨¨+ 3
.
¨¨3 4
Now
¨¨4 7
;
¨¨7 8

objTeamUrl
≠≠ 
.
≠≠ !
UsuarioModificacion
≠≠ .
=
≠≠/ 0
userName
≠≠1 9
;
≠≠9 :

objTeamUrl
ÆÆ 
.
ÆÆ 
FechaModificacion
ÆÆ ,
=
ÆÆ- .
DateTime
ÆÆ/ 7
.
ÆÆ7 8
Now
ÆÆ8 ;
;
ÆÆ; <
lstTeamUrls
∞∞ 
.
∞∞ 
Add
∞∞ 
(
∞∞  

objTeamUrl
∞∞  *
)
∞∞* +
;
∞∞+ ,
}
±± 
return
µµ 
new
µµ  
ImportTeamResponse
µµ )
(
µµ) *
)
µµ* +
{
∂∂ 
Teams
∑∑ 
=
∑∑ 
lstTeam
∑∑ 
,
∑∑  
TeamUrls
∏∏ 
=
∏∏ 
lstTeamUrls
∏∏ &
}
ππ 
;
ππ 
}
∫∫ 	
public
ºº )
ExportRankingReportResponse
ºº *!
ExportRankingReport
ºº+ >
(
ºº> ?(
ExportRankingReportRequest
ºº? Y(
exportRankingReportRequest
ººZ t
,
ººt u
string
ººv |
templateRootºº} â
)ººâ ä
{ººã å
var
ææ 
dtRankingReport
ææ 
=
ææ  !(
exportRankingReportRequest
ææ" <
.
ææ< =
rankingReports
ææ= K
.
ææK L
ToTable
ææL S
(
ææS T
)
ææT U
;
ææU V
var
øø 
wkReport
øø 
=
øø 
new
øø 

XLWorkbook
øø )
(
øø) *
templateRoot
øø* 6
)
øø6 7
;
øø7 8
wkReport
¡¡ 
.
¡¡ 
	Worksheet
¡¡ 
(
¡¡ 
$num
¡¡  
)
¡¡  !
.
¡¡! "
Cell
¡¡" &
(
¡¡& '
$num
¡¡' (
,
¡¡( )
$num
¡¡* +
)
¡¡+ ,
.
¡¡, -

InsertData
¡¡- 7
(
¡¡7 8
dtRankingReport
¡¡8 G
)
¡¡G H
;
¡¡H I
MemoryStream
√√ 
oMemoryStream
√√ &
=
√√' (
new
√√) ,
MemoryStream
√√- 9
(
√√9 :
)
√√: ;
;
√√; <
wkReport
ƒƒ 
.
ƒƒ 
SaveAs
ƒƒ 
(
ƒƒ 
oMemoryStream
ƒƒ )
)
ƒƒ) *
;
ƒƒ* +

CustomFile
∆∆ 
	excelFile
∆∆  
=
∆∆! "
new
∆∆# &

CustomFile
∆∆' 1
(
∆∆1 2
)
∆∆2 3
;
∆∆3 4
	excelFile
«« 
.
«« 
FileName
«« 
=
««  
$str
««! <
;
««< =
	excelFile
»» 
.
»» 
ContentType
»» !
=
»»" #
$str
»»$ g
;
»»g h
	excelFile
…… 
.
…… 
FileContents
…… "
=
……# $
oMemoryStream
……% 2
.
……2 3
ToArray
……3 :
(
……: ;
)
……; <
;
……< =
return
ÀÀ 
new
ÀÀ )
ExportRankingReportResponse
ÀÀ 2
(
ÀÀ2 3
)
ÀÀ3 4
{
ÃÃ 
	ExcelFile
ÕÕ 
=
ÕÕ 
	excelFile
ÕÕ %
}
ŒŒ 
;
ŒŒ 
}
–– 	
}
““ 
}”” è	
zC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Agents\ClosedXML\IClosedXMLAgent.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Agents) /
./ 0
	ClosedXML0 9
{		 
public

 

	interface

 
IClosedXMLAgent

 $
{ "
ImportCampaignResponse 
ImportCampaign -
(- .!
ImportCampaignRequest. C!
importCampaignRequestD Y
,Y Z
string[ a
userNameb j
)j k
;k l
ImportTeamResponse 

ImportTeam %
(% &
ImportTeamRequest& 7
importTeamRequest8 I
,I J
stringK Q
userNameR Z
)Z [
;[ \'
ExportRankingReportResponse #
ExportRankingReport$ 7
(7 8&
ExportRankingReportRequest8 R&
exportRankingReportRequestS m
,m n
stringo u
templateRoot	v Ç
)
Ç É
;
É Ñ
} 
} ÷
çC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Agents\ClosedXML\Request\ExportRankingReportRequest.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Agents) /
./ 0
	ClosedXML0 9
.9 :
Request: A
{ 
public		 

class		 &
ExportRankingReportRequest		 +
{

 
public 
List 
< 
RankingReport !
>! "
rankingReports# 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
} 
} é
àC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Agents\ClosedXML\Request\ImportCampaignRequest.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Agents) /
./ 0
	ClosedXML0 9
.9 :
Request: A
{ 
public		 

class		 !
ImportCampaignRequest		 &
{

 
public 
	IFormFile 
file 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} Ü
ÑC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Agents\ClosedXML\Request\ImportTeamRequest.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Agents) /
./ 0
	ClosedXML0 9
.9 :
Request: A
{ 
public		 

class		 
ImportTeamRequest		 "
{

 
public 
	IFormFile 
file 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} ¢
èC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Agents\ClosedXML\Response\ExportRankingReportResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Agents) /
./ 0
	ClosedXML0 9
.9 :
Response: B
{ 
public		 

class		 '
ExportRankingReportResponse		 ,
{

 
public 

CustomFile 
	ExcelFile #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ß
äC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Agents\ClosedXML\Response\ImportCampaignResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Agents) /
./ 0
	ClosedXML0 9
.9 :
Response: B
{ 
public 

class "
ImportCampaignResponse '
{		 
public

 
List

 
<

 
ImportCampaign

 "
>

" #
	Campaigns

$ -
{

. /
get

0 3
;

3 4
set

5 8
;

8 9
}

: ;
public 
List 
< 
ImportCampaignUrl %
>% &
CampaignUrls' 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
} 
} è
ÜC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Agents\ClosedXML\Response\ImportTeamResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Agents) /
./ 0
	ClosedXML0 9
.9 :
Response: B
{ 
public 

class 
ImportTeamResponse #
{		 
public

 
List

 
<

 

ImportTeam

 
>

 
Teams

  %
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
public 
List 
< 
ImportTeamUrl !
>! "
TeamUrls# +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
} 
} ’
pC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Agents\LDAP\ILDAPAgent.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Agents) /
./ 0
LDAP0 4
{ 
public		 

	interface		 

ILDAPAgent		 
{

  
ValidateUserResponse 
ValidateUser )
() *
ValidateUserRequest* =
validateUserRequest> Q
)Q R
;R S
} 
} Ä
oC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Agents\LDAP\LDAPAgent.cs
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
 
Infrastructure

 (
.

( )
Agents

) /
.

/ 0
LDAP

0 4
{ 
public 

class 
	LDAPAgent 
: 

ILDAPAgent '
{ 
private 
readonly 

LdapConfig #
_config$ +
;+ ,
public 
	LDAPAgent 
( 
IOptions !
<! "

LdapConfig" ,
>, -
config. 4
)4 5
{ 	
_config 
= 
config 
. 
Value "
;" #
} 	
public  
ValidateUserResponse #
ValidateUser$ 0
(0 1
ValidateUserRequest1 D
validateUserRequestE X
)X Y
{ 	
bool 
isLoginTrue 
= 
false $
;$ %
LdapConnection 
ldapConn #
=$ %
new& )
LdapConnection* 8
(8 9
)9 :
;: ;
try 
{ 
ldapConn 
. 
Connect  
(  !
_config! (
.( )
Host) -
,- .
_config/ 6
.6 7
Port7 ;
); <
;< =
ldapConn 
. 
Bind 
( 
validateUserRequest 1
.1 2
Username2 :
+; <
_config= D
.D E
DomainE K
,K L
validateUserRequestM `
.` a
Passworda i
)i j
;j k
isLoginTrue 
= 
true "
;" #
}   
catch!! 
(!! 
	Exception!! 
)!! 
{"" 
}$$ 
return'' 
new''  
ValidateUserResponse'' +
(''+ ,
)'', -
{''. /
isLoginTrue''0 ;
=''< =
isLoginTrue''> I
}''J K
;''K L
}(( 	
}++ 
},, ù
ÅC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Agents\LDAP\Request\ValidateUserRequest.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Agents) /
./ 0
LDAP0 4
.4 5
Request5 <
{ 
public 

class 
ValidateUserRequest $
{ 
public		 
string		 
Username		 
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
 
Password
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
} Ñ
ÇC:\Miguel\GitHub\PremiosBelcorp\app\Premios.Application\Belcorp.Premios.Infrastructure.Agents\LDAP\Respose\ValidateUserResponse.cs
	namespace 	
Belcorp
 
. 
Premios 
. 
Infrastructure (
.( )
Agents) /
./ 0
LDAP0 4
.4 5
Respose5 <
{ 
public 

class  
ValidateUserResponse %
{ 
public		 
bool		 
isLoginTrue		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
}

 
} 