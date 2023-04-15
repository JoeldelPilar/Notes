# Notes - projektreflektion

av Joel del Pilar, FED22D

## Arbetsflöde

Jag började projektet med att tänkta igenom ett användarflöde och skissade ner det med hjälp av "mirro" (se /documentation/structure_chart.png). <br>
Detta gjorde jag dagen vi fick uppgiften och nästan hela fm/em gick åt. Jag ville skapa mig en bild av omfattningen av uppgiften och dess svårighetsgrad, <br>
för att också se hur jag kunde ta ut svängarna då vi fick hyffsat fria händer med arkitekturen. <br>
<br>
Efter att jag hade min skiss började jag sätta upp en MySQL databas, jag valde Jannes rekomentadion MAMP för att vara säker på att kunna få effektiv hjälp <br>
utifall något skulle strulla. Databasen utformning hade jag med i skissen. <br>
<br>
Efter att databasen satts upp gick jag över på backenden och satte upp den, skapde routes och även en tests.rest-fil för att testa funktionen mellan API och DB. <br>
Detta valde jag att göra för att ha ett tydligt mål med hur jag skulle senare skriva anropen till mitt API från min frontend. <br>
<br>
Min Frontend-applikation är utvecklad i Vue.js 3 med Compositions API (Options API är alternativet och är mer som Vue 2). Jag ville sätta min egen problemlösningsförmåga <br>
på prov. Det är nu jag har tiden att lära mig, testa på och utforska och jag har insett att det är jag själv som sätter ribban, inte kursinnehållet! <br>
<br>
Så detta var hur jag valde att att arbeta flödesmässigt, DATABAS > API/BACKEND > FRONTEND

## Databasen

Jag har användt uuid v4 för att skapa min nyckel mellan användare och skapade dokument. Det är enkelt att använda, alltid unikt och då kravet inte fanns att skapa nya användare <br>
via frontenden så kunde jag använda mig av en uuid-generator (https://www.uuidgenerator.net/version4) för att skapa mina nycklar. <br>
Jag valde att lägga till en deleted-kolum för både användare och dokument då det i framtiden skulle kunna bli ett krav och då skulle inte databasen behöva byggas om för den implementeringen.<br>
Jag har inte stött på några större problem med att skapa och hantera min databas, Jag hade i början en fundering kring hur jag skulle spara själva innehållet från dokumenten men jag gjorde lite <br>
efterforskningar och landade på VARCHAR 8000. Enligt det jag hittade var 8000 tillräckligt stort för bloginlägg/längre texter och för att inte ta upp onödigt mycket utrymme valde jag det.

## Backend

Jag valde magic link som inloggning. Då jag planerade projektet ordentligare än jag gjort förut så ville jag utmana mig själv och räknade med att jag skulle hinna med detta. Jag ville pröva på att <br>
hamna i situationen där jag själv behövde läsa dokumentation, efterforska och TÄNKA själv. Mycket lärorikt! Jag behövde nått sätt att skicka mail och kom in på sendgrid. Jag kunde sätta upp ett <br>
studentkonto efter endel mail fram och tillbaka med deras kundservice. Jag fick 100 mejl/dag gratis.
<br>
<br>
Här mötte jag ett av två störta problemen under utvecklingen, hur jag skulle verifiera en användare. Jag valde att använda JWT-paketet för att skapa en token som skickas till användarens mejl. JWT kändes <br>
som en säker källa utifrån hur vi fått lära oss att utvärdera olika npm-pakets säkerhet genom hur de uppdateras och mängden användning. Sen hade JWT en egen sida med dokumentation som gjorde det lätt<br>
att använda. <br>
Det andra stora problem jag stötte på har en koppling mellan back-och-frontenden. Hur jag skulle kunna redigera och spara om ett dokument. Jag satt länge med state-management i fronten innan jag kom på att <br>
använda min skiss från dag ett. Jag hade missat att göra en PUT-route och använda det anropet i min front. När jag väl insåg det kom lösningen, se mer info under Frontend.

## Frontend

Skapad med Vue.js 3, som jag beskrev innan ville jag utmana mig själv. Vue började jag använda dels för att det kommer senare i kursen men inte har samma fokus som React & jag tänkte att jag ger det tid nu <br>
för att förhoppningsvis ha två ben att stå på efter utbildningen, sett ur ett ramverksperspektiv. Sen har vi haft Jenni som en stark förespråkare för det. <br>
Jag visste att jag skulle behöva gå djupare i mina Vue kunskaper för att klara av uppgiften och projektet har vart en bra hjälp för det. Jag behövde lära mig om statemanagement och valde Pinia (vuex finns med)<br>
som är deras nya system, som är lättare att arbeta med (enl Vue själva).<br>
<br>
En stor sak här är användandet av "teleport". När en användare klickar på ett dokument så teleporteras den komponenten/modal till slutet av body, detta för att kunna få presentationen med position absolute att <br>
inte bugga. Samma sak när man ska redigera ett dokument. Detta för att öka tydligheten kring att användaren arbetar/interagerar med någon befintligt, jag ville skapa en skarp skillnad mellan nyskapandet och <br>
det som redigeras. Känslan bli också att appen har ett annat djup. <br>
För att öppna texteditorn har jag valt stora och tydligt färgkodade knappar, det ska gå snabbt att hitta och komma åt huvudinnehållet men samtidigt hålla UI rent och städat.

## Övrigt

Oavsett vilken mejl som skrivs in så kommer uppmaningen till använadaren att kolla sin mejl. Detta för att ingen ska kunna skriva in olika mejladresser för att se vilka som finns i databasen. För att få en <br>
ny användaren behöver den läggas in manuellt i databasen. Om tanken är att ett företag ska använda appen internt är det ytterligare ett skydd. <br>
<br>
JTW som skickas till användarens mejl är gilltig i 1h, för att användaren ska hinna in på sin mejl men också för att appen körs i browsern och hur ofta har man inte råktat stänga ner ett fönster av misstag. <br>
I detta fall behöver användaren inte göra om inloggingen utan bara klicka på länken i sin mejl, förutsatt då att det inte gått 1h. En bugg som kvarstår är att efter 1h, om man refreshar fönstret så får man <br>
ett felmeddelande i konsolen som säger att token inte är giltig längre, dock funkar appen då användarens uuid finns sparat i LS och håller denne inloggad.<br>
<br>
Efter demo med Lisa läste jag igenom beskrivningen igen och valde att alla kan se och redigera dokumenten, för att jag ser det som ett internt verktyg i en organisation, och så tolkar jag beskrivningen med efter <br>
att läst igenom den igen. Den som skapat ett dokument är author av det och jag valde att behålla det så istället för att uppdatera author när det redigerats. Vill man ändra detta behöver man bara uppdatera <br>
queryn i backend så att den uppdaterar author med det inloggade uuid:et.
