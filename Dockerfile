FROM python:3.8
WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8089
ENV DJANGO_SETTINGS_MODULE=timadmin.settings
CMD ["python", "timadmin/manage.py", "runserver", "0.0.0.0:8089"]
