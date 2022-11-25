//colsole.log() function automatically send lags to AWS CloudWatch when the lambda fuction is triggered
export const handler = async(event) => {
    // TODO implement
    const response = {
        statusCode: 200,
        body: JSON.stringify('Hello from Lambda!'),
    };
    console.log("Status: " + response.statusCode + ", Message: " + response.body);
    return response;
};
