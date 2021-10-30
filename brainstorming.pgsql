
CREATE TABLE bookings (
    booking_id SERIAL primary key,
    court_name varchar(20) not null, 
    start_date TIMESTAMP not null,
    end_date TIMESTAMP not null
);

INSERT INTO bookings (court_name, start_date, end_date)  
VALUES('court 1', '2021-10-31 13:00', '2021-10-31 17:00');
INSERT INTO bookings (court_name, start_date, end_date)  
VALUES('court 2', '2021-10-31 16:00', '2021-10-31 17:00');
INSERT INTO bookings (court_name, start_date, end_date)  
VALUES('court 3', '2021-10-31 18:30', '2021-10-31 20:00');
INSERT INTO bookings (court_name, start_date, end_date)  
VALUES('court 2', '2021-10-31 17:30', '2021-10-31 19:30');
INSERT INTO bookings (court_name, start_date, end_date)  
VALUES('court 1', '2021-10-31 17:00', '2021-10-31 18:30');
INSERT INTO bookings (court_name, start_date, end_date)  
VALUES('court 3', '2021-10-31 18:00', '2021-10-31 18:30');
-- what are the available courts tomorrow at 18:00 for 1 hour?
-- do I have any courts that their bookings start or end between 18 and 19?
    -- if I find NO bookings => courts are available :)
    -- if I find bookings for court 1 => court 2 is available :)
    -- if I find bookings for court 2 => court 1 is available :)
    -- if I find bookings for court 1 and 2 => no slots available :(
select * from bookings
    where (start_date > '2021-10-31 18:00' and start_date < '2021-10-31 19:00'
            or end_date > '2021-10-31 18:00' and end_date < '2021-10-31 19:00')
        or (start_date < '2021-10-31 18:00' and end_date > '2021-10-31 19:00');
