--Do zrobienia:
--1. Warunek dla eventhandlera czy koles nie zginal (jak zginie zaczyna liczyc od nowa)                 --> Zrobione
--2. Ma zliczac samoloty, najlepiej przeciwnika i (helki ludzkie, nieludzkim mowimy stanowcze nie)      --> Zrobione
--3. Pomijanie pierwszego killa (liczy do 5 dla kadzego inny komunikat na 6 Nagroda)                    --> Zrobione
--5. Dodanie dzwiekow                                                                                   --> Do zrobienia
--6. Nagroda za serie zabojstw                                                                          --> Do zrobienia
--7. Dodanie customowych kominikatow po zabojstwie, zesmiesznym dopiskiem                               --> Do zrobienia
--   jesli sie da to losowym np. "SanchoPancho - DoubleKILL //Wali ich jak Lucas phoenixami Hancera//"

--zamienia tabele na tekst
function DumpTable(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '' .. k .. ''
            end
            s = s .. '[' .. k .. '] = ' .. DumpTable(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

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

--liczy kille tylko dla samolotow i helek
function deduwa:OnEventKill(EventData)
    gracz = EventData.IniPlayerName

    if EventData.TgtCategory == Unit.Category.AIRPLANE or EventData.TgtCategory == Unit.Category.HELICOPTER then
        if not wyniki[gracz] then
            wyniki[gracz] = 0
        end
        wyniki[gracz] = wyniki[gracz] + 1
    end


    if myTable[wyniki[gracz]] then
        MESSAGE:New(EventData.IniPlayerName .. " " .. "-" .. " " .. myTable[wyniki[gracz]], 20):ToAll()
    end

    gracz_zabity = EventData.TgtPlayerName
    if wyniki[gracz_zabity] ~= nil then
        wyniki[gracz_zabity] = nil
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

--EventHandler = EVENTHANDLER:New()
--EventHandler:HandleEvent(EVENTS.Dead)
--function EventHandler:OnEventDead(EventData)
--    BASE:I(EventData)
--end
