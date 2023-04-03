--Do zrobienia:
--1. Warunek dla eventhandlera czy koles nie zginal (jak zginie zaczyna liczyc od nowa)                 --> W trakcie
--2. Ma zliczac samoloty, najlepiej przeciwnika i helki ludzkie, nieludzkim mowimy stanowcze nie        -->
--3. Pomijanie pierwszego killa (liczy do 5 dla kadzego inny komunikat na 6 Nagroda)                    -->
--5. Dodanie dzwiekow                                                                                   -->
--6. Nagroda za serie zabojstw                                                                          -->
--7. Dodanie customowych kominikatow po zabojstwie, zesmiesznym dopiskiem                               -->
--   jesli sie da to losowym np. "SanchoPancho - DoubleKILL //Wali ich jak Lucas phoenixami Hancera//"

wyniki = {}
-- Reakcja na zniszczenie samolotu przeciwnika
--EVENTHANDLER={}

deduwa = EVENTHANDLER:New()
deduwa:HandleEvent(EVENTS.Kill)

function deduwa:OnEventKill(EventData)
    gracz = EventData.IniPlayerName
    MESSAGE:New(" gracz = " .. EventData.IniPlayerName .. " ", 20):ToAll()

    if wyniki[gracz] == nil then
        wyniki[gracz] = 1
    else
        wyniki[gracz] = wyniki[gracz] + 1
    end
    --"20" czas wyświetlania wiadomości
    MESSAGE:New(" gracz wynik = " .. wyniki[gracz] .. " ", 20):ToAll()
end

-- Reset licznika jeśli (trzeba zamienić na eventDeath)
function deduwa:OnEventKill(EventData)
    gracz = EventData.TgtPlayerName
    MESSAGE:New(" gracz zabity = " .. gracz .. " ", 20):ToAll()

    if wyniki[gracz] ~= nil then
        wyniki[gracz] = nil
    end
end

-- Reset licznika jak zmieni slota
podrabiana_deduwa = EVENTHANDLER:New()
podrabiana_deduwa:HandleEvent(EVENTS.PlayerEnterAircraft)

function podrabiana_deduwa:OnEventPlayerEnterAircraft(EventData)
    gracz = EventData.IniPlayerName
    MESSAGE:New(" gracz śmierć = " .. EventData.IniPlayerName .. " ", 20):ToAll()
    Wyniki[gracz] = nil
end

EventHandler = EVENTHANDLER:New()
EventHandler:HandleEvent(EVENTS.Dead)
function EventHandler:OnEventDead(EventData)
    BASE:I(EventData)
end
