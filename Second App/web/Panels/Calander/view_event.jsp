
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href='css/fullcalendar.min.css' rel='stylesheet' />
        <link href='css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
        <link href='css/calendar-custom.css' rel='stylesheet' />
        <script src='js/moment.min.js'></script>
        <script src='js/jquery.min.js'></script>
        <script src='js/fullcalendar.min.js'></script>

        <script>
            $(document).ready(function () {

                $('#calendar').fullCalendar({
                    defaultDate: '2019-04-01',
                    editable: true,
                    eventLimit: true, // allow "more" link when too many events
                    events: "<%=request.getContextPath()%>/CalendarJsonServlet"
                });

            });

        </script>
    </head>
    <body>
        <div class="cal-main">
            <div id="calendar" class="cal"></div>
        </div>
    </body>
</html>
