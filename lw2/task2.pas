PROGRAM SarahRevere(INPUT, OUTPUT);
USES
  DOS;
VAR
  Letter: STRING;
BEGIN{SarahRevere}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  Letter:= GetEnv('QUERY_STRING');
  IF Letter= 'lanterns=1'
  THEN
    WRITELN('The British are coming by land.')
  ELSE
    IF Letter= 'lanterns=2'
    THEN
      WRITELN('The British are coming by sea.')
    ELSE
      WRITELN('Sarah didn''t send a message.')
END.{SarahRevere}
