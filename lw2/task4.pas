PROGRAM WorkWithQueryString(INPUT, OUTPUT);
USES
  DOS;
FUNCTION Max(a,b:integer):integer;
BEGIN{Max}
  IF a > b
  THEN
    Max:=a
  ELSE
    Max:=b
END;{Max}
FUNCTION Min(a,b:integer):integer;
BEGIN{Min}
  IF a < b
  THEN
    Min:=a
  ELSE
    Min:=b
END;{Min}
FUNCTION GetQueryStringParameter(Key: STRING): STRING;
BEGIN{GetQueryStringParameter}
  IF Key = 'first_name'
  THEN
    BEGIN
	  IF (POS('first_name=', GetEnv('QUERY_STRING')) > POS('last_name=', GetEnv('QUERY_STRING'))) AND (POS('first_name=', GetEnv('QUERY_STRING')) > POS('age=', GetEnv('QUERY_STRING')))
	  THEN
        GetQueryStringParameter:=COPY(GetEnv('QUERY_STRING'),POS('first_name=', GetEnv('QUERY_STRING'))+11)
	  ELSE
	    IF (POS('first_name=', GetEnv('QUERY_STRING')) < POS('last_name=', GetEnv('QUERY_STRING'))) AND (POS('first_name=', GetEnv('QUERY_STRING')) < POS('age=', GetEnv('QUERY_STRING')))
	    THEN
		  GetQueryStringParameter:=COPY(GetEnv('QUERY_STRING'),POS('first_name=', GetEnv('QUERY_STRING'))+11, Min(POS('last_name=', GetEnv('QUERY_STRING')),POS('age=', GetEnv('QUERY_STRING'))) - POS('first_name=', GetEnv('QUERY_STRING')) - 11)
		ELSE
          GetQueryStringParameter:=COPY(GetEnv('QUERY_STRING'),POS('first_name=', GetEnv('QUERY_STRING'))+11, Max(POS('last_name=', GetEnv('QUERY_STRING')),POS('age=', GetEnv('QUERY_STRING'))) - POS('first_name=', GetEnv('QUERY_STRING')) - 11)		
	END
  ELSE
    IF Key = 'last_name'
	THEN
	  BEGIN
	    IF (POS('last_name=', GetEnv('QUERY_STRING')) > POS('first_name=', GetEnv('QUERY_STRING'))) AND (POS('last_name=', GetEnv('QUERY_STRING')) > POS('age=', GetEnv('QUERY_STRING')))
	    THEN
          GetQueryStringParameter:=COPY(GetEnv('QUERY_STRING'),POS('last_name', GetEnv('QUERY_STRING'))+10)
	    ELSE
	      IF (POS('last_name=', GetEnv('QUERY_STRING')) < POS('first_name=', GetEnv('QUERY_STRING'))) AND (POS('last_name=', GetEnv('QUERY_STRING')) < POS('age=', GetEnv('QUERY_STRING')))
	      THEN
		    GetQueryStringParameter:=COPY(GetEnv('QUERY_STRING'),POS('last_name=', GetEnv('QUERY_STRING'))+10, Min(POS('first_name=', GetEnv('QUERY_STRING')),POS('age=', GetEnv('QUERY_STRING'))) - POS('last_name=', GetEnv('QUERY_STRING')) - 10)
		  ELSE
            GetQueryStringParameter:=COPY(GetEnv('QUERY_STRING'),POS('last_name=', GetEnv('QUERY_STRING'))+10, Max(POS('first_name=', GetEnv('QUERY_STRING')),POS('age=', GetEnv('QUERY_STRING'))) - POS('last_name=', GetEnv('QUERY_STRING')) - 10)		
	END
	ELSE
	  IF Key = 'age'
	  THEN
	    BEGIN
	      IF (POS('age=', GetEnv('QUERY_STRING')) > POS('last_name=', GetEnv('QUERY_STRING'))) AND (POS('age=', GetEnv('QUERY_STRING')) > POS('first_name=', GetEnv('QUERY_STRING')))
	      THEN
            GetQueryStringParameter:=COPY(GetEnv('QUERY_STRING'),POS('age=', GetEnv('QUERY_STRING'))+4)
	      ELSE
	        IF (POS('age=', GetEnv('QUERY_STRING')) < POS('last_name=', GetEnv('QUERY_STRING'))) AND (POS('age=', GetEnv('QUERY_STRING')) < POS('first_name=', GetEnv('QUERY_STRING')))
	        THEN
		      GetQueryStringParameter:=COPY(GetEnv('QUERY_STRING'),POS('age=', GetEnv('QUERY_STRING'))+4, Min(POS('last_name=', GetEnv('QUERY_STRING')),POS('first_name=', GetEnv('QUERY_STRING'))) - POS('age=', GetEnv('QUERY_STRING')) - 4)
		    ELSE
              GetQueryStringParameter:=COPY(GetEnv('QUERY_STRING'),POS('age=', GetEnv('QUERY_STRING'))+4, Max(POS('last_name=', GetEnv('QUERY_STRING')),POS('first_name=', GetEnv('QUERY_STRING'))) - POS('age=', GetEnv('QUERY_STRING')) - 4)		
	END
END;{GetQueryStringParameter}

BEGIN {WorkWithQueryString}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  WRITELN('First Name: ', GetQueryStringParameter('first_name'));
  WRITELN('Last Name: ', GetQueryStringParameter('last_name'));
  WRITELN('Age: ', GetQueryStringParameter('age'))
END. {WorkWithQueryString}
