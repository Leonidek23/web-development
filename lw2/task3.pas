PROGRAM HelloName(INPUT, OUTPUT);
USES
  DOS;
BEGIN{SarahRevere}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  IF COPY(GetEnv('QUERY_STRING'),1,5)= 'name='
  THEN
    WRITELN('Hello dear,', COPY(GetEnv('QUERY_STRING'),6, POS('&', GetEnv('QUERY_STRING'))-6), '!')
  ELSE
    WRITELN('Hello Anonymous!')
END.{SarahRevere}
