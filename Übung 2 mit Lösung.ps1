# Properties abrufen
# ------------------

# Welchen Starttype hat der Dienst bits?
(Get-Service -Name BITS).StartType

# Was ist die Description des Prozesses lsass? Ist der Prozeß Responding? Was ist der Pfad?
(Get-Process -Name lsass).Description
(Get-Process -Name lsass).Responding
(Get-Process -Name lsass).Path

# Der vievielte Tag des Jahres ist heute?
(Get-Date).DayOfYear


# Methoden anwenden
# -----------------

# Geben Sie den Anzeigenamen des Dienstes bits in GROSSBUCHSTABEN aus!
(Get-Service -Name BITS).DisplayName.ToUpper()

# Starten Sie notepad.exe und beenden Sie den Prozeß!
notepad
(Get-Process -Name notepad).Kill()

# Welches Datum ist heute in vier Wochen (in 28 Tagen)?
(Get-Date).AddDays(28)