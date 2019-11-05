#!/bin/sh -e

NOTIFY_SEND='notify-send -u critical "Reminder" "%s"'

/usr/bin/remind -r -z -k"$NOTIFY_SEND" ~/.reminders
