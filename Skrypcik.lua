--Do zrobienia:
--1. Warunek dla eventhandlera czy koles nie zginal (jak zginie zaczyna liczyc od nowa)                 --> Nie dziala
--2. Ma zliczac samoloty, najlepiej przeciwnika i helki ludzkie, nieludzkim mowimy stanowcze nie        --> Do zrobienia
--3. Pomijanie pierwszego killa (liczy do 5 dla kadzego inny komunikat na 6 Nagroda)                    --> Zrobione
--5. Dodanie dzwiekow                                                                                   --> Do zrobienia
--6. Nagroda za serie zabojstw                                                                          --> Do zrobienia
--7. Dodanie customowych kominikatow po zabojstwie, zesmiesznym dopiskiem                               --> Do zrobienia
--   jesli sie da to losowym np. "SanchoPancho - DoubleKILL //Wali ich jak Lucas phoenixami Hancera//"


wyniki = {}

-- Reakcja na zniszczenie samolotu przeciwnika
--EVENTHANDLER={}
deduwa = EVENTHANDLER:New()
deduwa:HandleEvent(EVENTS.Kill)

--Struktura danych
myTable = {
    [2] = "DOUBLE KILL!",
    [3] = "TRIPLE KILL!",
    [4] = "QUADRA KILL!",
    [5] = "PENTA KILL!",
    [6] = "DOMINATING!",
    [7] = "GODLIKE!",
    [8] = "LEGENDARY!",
}

--liczy kille, dziala nie dotykac
function deduwa:OnEventKill(EventData)
    gracz = EventData.IniPlayerName
    if wyniki[gracz] == nil then
        wyniki[gracz] = 1
    else
        wyniki[gracz] = wyniki[gracz] + 1
    end

    if myTable[wyniki[gracz]] then
        MESSAGE:New(EventData.IniPlayerName .. " " .. "-" .. " " .. myTable[wyniki[gracz]], 20):ToAll()
        env.info("poszlo")
    end
end

-- Reset licznika jeśli (trzeba zamienić na eventDeath)
function reset_deduwa:OnEventKill(EventData)
    gracz = EventData.TgtPlayerName
    --    MESSAGE:New(" gracz zabity = " .. gracz .. " ", 20):ToAll()

    if wyniki[gracz] ~= nil then
        wyniki[gracz] = nil
    end
end

-- Reset licznika jak zmieni slota, cos w nim nie dziala
podrabiana_deduwa = EVENTHANDLER:New()
podrabiana_deduwa:HandleEvent(EVENTS.PlayerEnterAircraft)

function podrabiana_deduwa:OnEventPlayerEnterAircraft(EventData)
    gracz = EventData.IniPlayerName
    MESSAGE:New(" gracz śmierć = " .. EventData.IniPlayerName .. " ", 20):ToAll()
    wyniki[gracz] = nil
end

EventHandler = EVENTHANDLER:New()
EventHandler:HandleEvent(EVENTS.Dead)
function EventHandler:OnEventDead(EventData)
    BASE:I(EventData)
end
