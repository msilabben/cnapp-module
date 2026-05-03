# Workshop - modul 2: Sikker kode og pipeline herding 

Temaet for denne workshoppen er sikker kode og pipeline herding. Vi skal gå gjennom tre temaer: utviklingsmiljø, pipeline og git repository. Det vil være oppgaver knyttet til hver av disse temaene.

Krav: 
- GitHub bruker
- (Valgfritt) IDE
    - Oppgavene som krever kodeendring, kan enten gjøres lokalt på din maskin, eller bruke GitHub Desktop.

### Oppsett
1. Gi GitHub brukernavnet til fasilitator, slik at dere kan bli invitert til organisasjonen: "msilabben". 
2. Godkjenn invitasjonen
3. Gå til [cnapp-module](https://github.com/msilabben/cnapp-module)
4. Klikk på "Fork" inne på cnapp-module repoet, oppe til høyre
5. Velg organisasjonen "msilabben" som eier.
6. Trykk på "<> Code", og enten clone ned repoet lokalt på maskinen din eller trykk på headeren "Codespaces" og velg "Create codespace on main". 


Si ifra til fasilitator hvis dere møter på problemer. 


## Oppgaver - Utviklingsmiljø 

### Legg til ny epostaddresse 
1. Trykk på ditt brukerikon og velg "settings". Deretter trykk på "Emails". 
2. Under "Keep my email addresses private" kan dere toggle en knapp for å skru dette på. 
3. I teksten under toggle-knappen, og i teksten over eposten deres, vil dere finne en epost-addresse som ligner på: "<tall>+<brukernavn>>@users.noreply.github.com", kopier denne epostaddressen. 
4. I GitHub Codespaces, i terminalen din, skriv inn: `git config user.email "<tall>+<brukernavn>>@users.noreply.github.com"`. 
5. Gjør en forandring i en fil. 
6. Kjør "

 
### Commit en hemmelighet
1. I terminalen, skriv: `git checkout -b "developer_environment"` eller venstre-klikk på "main" nederst venstre hjørne, velg "+ Create new branch" og skriv inn "developer_environment".
2. Lag en ny fil 
3. Legg til "api_key = "heiheitest134984tj3p948hf487hoigto87gtwø8y928257t43759438yth3" i fila
4. `git add "filename"
5. Sett upstream til å være ditt eget repo 



### Commit sårbar kode 
1. 


### Signerte commits
1. Åpne terminalen din å trykke på hamburgermenyen i høyre hjørnet (tre streker). Velg "Terminal", deretter "New terminal". 
2. I terminal, skriv inn `ssh-keygen -t ed25519 -C "navn@epost.com"`
4. Kjør `gpg --armor --export GPG_NØKKEL_ID`. Kopier den offentlige nøkkelen, og legg den til på GitHub brukeren din. 
    - Trykk på ditt brukerikon og velg "settings". 
    - Velg deretter "SSH and GPG keys". 
    - Trykk "New SSH key"
    - Skriv inn ett navn for nøkkelen, velg "signing key" og kopier inn den offentlige nøkkelen. 
    - Trykk på "Add SSH key" 
5. For å legge inn nøkkelen på GitHub brukeren din, for dette repoet, kjør `git config user.signingkey PRIVAT_KEY_PATH`
6. For å signere en commit, legg til flagget `-s` slik som følgende: `git commit -s -m "din commit melding"`
6. For å slippe å legge til `-s` ved hver commit, kjør `git config --global commit.gpgsign true` og `git config --global gpg.format ssh`
7. Observer i `git log` eller i commits på GitHub at din siste commit er blitt signert/verified.


## Oppgaver - pipelines


### Legge til kjøring av test i pipeline
1. Enable "backend test" i pull-request.yml 
2. Gå til test/test_app.py og forandre status koden fra 200 til 100. 
3. Add, commit og push forandringene til github
4. Se at pipeline kjører, og se at test kjører 
5. Gå tilbake og forandre status koden fra 100 til 200. 
6. Add, commit og push forandringene. 
7. Observer at test kjører. 

### Legg til secret scanning i pipeline
1. Åpne Codespaces 
2. Fjern kommentar i fil ".github/workflow/pull-request.yml"
3. Kjør i terminalen `git add .github/workflow/pull-request.yml`
4. Kjør i terminalen `git commit -m "add pre-commit in pull-request workflow"`
5. Kjør i terminalen `git push`


### Legg til trivy 
1. Enable trivy
2. Add, commit og push forandringene til GitHub 
3. Lag en pull request inn i ditt eget repo
4. Observer i pipelinen at trivy kjører. 
5. trykk på code scanning results/trivy, og velg på "view all branch results" 
6. finn error "image user should not be root"
7. Fiks feilen, ved å åpne backend/dockerfile 
8. Uncomment fiks i dockerfilen 
9. Add, commit, push 
10. Observer at trivy kjører og at erroren har forsvunnet fra "view all branch results"  


### Legg til Semgrep
1. Enable semgrep 
2. Add, commit og push forandringene til GitHub 
3. Observer i pipelinen at semgrep kjører 
4. trykk på code scanning results/semgrep oss
5. Trykk på "view all branch alerts" 


### Legg til OPA 
1. Enable OPA 
2. gå til policy/trivy.rego, config: max_high: 1
3. gå til policy/smegrep.rego, config: max_error: 1
4. add, commit og push forandringene 
5. gå på trivy -> summary, se at OPA er avhengig av de to andre. trykk på OPA
6. Observer stuff. 


### Legg til release pipeline
1. Godkjenn PR'en, og merge til main
2. Observer at ReleasePlease kjører 
3. Se at releaseplease opprettet en PR i "pull request" som heter "Chore: release main"
4. Se at versjon har blitt oppdatert 
5. Merge PR

### SBoM
1. På hovedsiden til repoet, gå til releases, og klikk på den siste. 
2. Finn releasen som akkurat kjørte, og velg assets. 
3. Klikk på sbom-fila, og last ned json fila
4. Observer versjonene av det som er installert på dette tidspunktet. 

### Scheduled pipeline 
1. Observer i PR'er at dependabot har kjørt og laget PR'er. 
2. Se at alle sjekkene som kjører i de tidligere pipelinene, kjører også nå
3. Sjekkene vil kjøre på dependabot sin PR, og dermed vil de andre sjekkene fange opp eventuelle ting som dependabot introduserer. 
