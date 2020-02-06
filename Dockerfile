FROM python:alpine

LABEL "com.github.actions.name"="yapf-formatter"
LABEL "com.github.actions.description"="Run YAPF formatter for Python codes."
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="black"

LABEL "repository"="https://github.com/diegovalenzuelaiturra/yapf-action.git"
LABEL "homepage"="https://github.com/diegovalenzuelaiturra/yapf-action"
LABEL "maintainer"="Diego Valenzuela Iturra <diegovalenzuela@protonmail.com>"

RUN pip install --upgrade pip
RUN pip install yapf

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
