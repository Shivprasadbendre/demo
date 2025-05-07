FROM python:3.11-slim
WORKDIR /my_floder
COPY . .
RUN pip install flask
EXPOSE 3000
CMD ["python","app.py"]