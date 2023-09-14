import pickle

from flask import Flask, request, app, jsonify,render_template

import numpy as np
import pandas as pd


app= Flask(__name__)

model=pickle.load(open('regmodel.pkl','rb'))

scalar=pickle.load(open('scaling.pkl','rb'))


@app.route('/')
def home():
    return render_template('home.html')


@app.route('/predict_api', methods=["Post"])
def predict_api():
    data= request.json['data']
    print(data)
    nd_data=np.array(list((data.values())).reshape(1,-1))
    print(nd_data)
    new_data= scalar.transform(nd_data)
    output=model.predict(new_data)
    print(output[0])
    return jsonify(output[0])



@app.route('/predict', methods=['POST'])
def predict():
    data=[float(x) for x in request.form.values()]
    final_input= scalar.transform(np.array(data).reshape(1,-1))
    print(final_input)
    output=model.predict(final_input)[0]
    return render_template('home.html', prediction_text="The House price predict is {}".format(output))

if __name__=="__main__":
    app.run(debug=True)