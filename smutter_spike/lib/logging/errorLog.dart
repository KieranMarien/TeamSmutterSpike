import 'package:aws_cloudwatch/aws_cloudwatch.dart';
import 'package:intl/intl.dart';

const String awsAccessKeyId = 'CRED';
const String awsSecretAccessKey = 'CRED';
const String region = 'CRED'; // (us-west-1, us-east-2, etc)
const String logGroupName  = 'CRED';

CloudWatchHandler logging = CloudWatchHandler(
  awsAccessKey: awsAccessKeyId,
  awsSecretKey: awsSecretAccessKey,
  region: region,

);

String logStreamName = '';


String _getLogStreamName() {
  if (logStreamName == '') {
    logStreamName = DateFormat('yyyy-MM-dd HH-mm-ss').format(
      DateTime.now().toUtc(),
    );
  }
  return logStreamName;
}

void log(String logString, {bool isError = false}) {
  logging.log(
    message: logString,
    logStreamName: _getLogStreamName(),
    logGroupName: logGroupName,
  );
}

void logFlutterSystemError(dynamic logString, dynamic stackTrace) {
  log(
    'Auto Captured Error: ${logString.toString()}\n\n'
    'Auto Captured Stack Trace:\n${stackTrace.toString()}',
    isError: true,
  );
}