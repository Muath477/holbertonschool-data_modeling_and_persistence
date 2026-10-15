DROP TABLE IF EXISTS registrations;
DROP TABLE IF EXISTS sessions;
DROP TABLE IF EXISTS attendees;
DROP TABLE IF EXISTS speakers;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS tracks;
DROP TABLE IF EXISTS companies;

-- companies has a single attribute today, but one company is shared by many
-- attendees, so it gets one row to rename or extend (website, country...).
CREATE TABLE companies (
    company_id INTEGER PRIMARY KEY,
    company_name TEXT NOT NULL UNIQUE
);

CREATE TABLE tracks (
    track_id INTEGER PRIMARY KEY,
    track_name TEXT NOT NULL UNIQUE
);

CREATE TABLE rooms (
    room_id INTEGER PRIMARY KEY,
    room_name TEXT NOT NULL UNIQUE
);

CREATE TABLE speakers (
    speaker_id INTEGER PRIMARY KEY,
    speaker_name TEXT NOT NULL,
    speaker_email TEXT NOT NULL UNIQUE
);

CREATE TABLE attendees (
    attendee_id INTEGER PRIMARY KEY,
    attendee_name TEXT NOT NULL,
    attendee_email TEXT NOT NULL UNIQUE,
    company_id INTEGER,
    FOREIGN KEY (company_id) REFERENCES companies (company_id)
);

CREATE TABLE sessions (
    session_id TEXT PRIMARY KEY,
    session_title TEXT NOT NULL,
    track_id INTEGER NOT NULL,
    room_id INTEGER NOT NULL,
    speaker_id INTEGER NOT NULL,
    FOREIGN KEY (track_id) REFERENCES tracks (track_id),
    FOREIGN KEY (room_id) REFERENCES rooms (room_id),
    FOREIGN KEY (speaker_id) REFERENCES speakers (speaker_id)
);

CREATE TABLE registrations (
    attendee_id INTEGER NOT NULL,
    session_id TEXT NOT NULL,
    PRIMARY KEY (attendee_id, session_id),
    FOREIGN KEY (attendee_id) REFERENCES attendees (attendee_id),
    FOREIGN KEY (session_id) REFERENCES sessions (session_id)
);

INSERT INTO companies (company_name)
SELECT DISTINCT company_name
FROM conference_registrations_flat
ORDER BY company_name;

INSERT INTO tracks (track_name)
SELECT DISTINCT track_name
FROM conference_registrations_flat
ORDER BY track_name;

INSERT INTO rooms (room_name)
SELECT DISTINCT room_name
FROM conference_registrations_flat
ORDER BY room_name;

INSERT INTO speakers (speaker_name, speaker_email)
SELECT DISTINCT speaker_name, speaker_email
FROM conference_registrations_flat
ORDER BY speaker_email;

INSERT INTO attendees (attendee_id, attendee_name, attendee_email, company_id)
SELECT DISTINCT conference_registrations_flat.attendee_id,
    conference_registrations_flat.attendee_name,
    conference_registrations_flat.attendee_email, companies.company_id
FROM conference_registrations_flat
INNER JOIN companies
    ON companies.company_name = conference_registrations_flat.company_name;

INSERT INTO sessions (session_id, session_title, track_id, room_id, speaker_id)
SELECT DISTINCT conference_registrations_flat.session_id,
    conference_registrations_flat.session_title, tracks.track_id,
    rooms.room_id, speakers.speaker_id
FROM conference_registrations_flat
INNER JOIN tracks
    ON tracks.track_name = conference_registrations_flat.track_name
INNER JOIN rooms
    ON rooms.room_name = conference_registrations_flat.room_name
INNER JOIN speakers
    ON speakers.speaker_email = conference_registrations_flat.speaker_email;

INSERT INTO registrations (attendee_id, session_id)
SELECT attendee_id, session_id
FROM conference_registrations_flat;
