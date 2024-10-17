const functions = require('firebase-functions');
const admin = require('firebase-admin');
const Stripe = require('stripe');

admin.initializeApp();
const stripe = Stripe('sk_test_51QAobXGkD5orp380LP7RwsAtxzuMA8Q2GWTbJDOq9OYthCYbk8kb1MGDJav6NhrEeyts7eFeAWvIXA3YuouGwxyJ00dVPutS8X');

exports.createPaymentIntent = functions.https.onRequest(async (req, res) => {
  try {
    const { amount, currency } = req.body;
    const paymentIntent = await stripe.paymentIntents.create({
      amount: amount,
      currency: currency,
    });

    res.send({
      clientSecret: paymentIntent.client_secret,
    });
  } catch (error) {
    res.status(500).send({ error: error.message });
  }
});
