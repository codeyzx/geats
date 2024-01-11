// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorizedRequest(String reason, bool isUnauthorizedRequest) = UnauthorizedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError(String reason) = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  const factory NetworkExceptions.unProcessableEntity(
    Map<String, dynamic> errors,
    String errorMessage,
  ) = UnProcessableEntity;

  static NetworkExceptions getFirebaseException(error) {
    if (error is Exception) {
      try {
        late NetworkExceptions networkExceptions;
        if (error is FirebaseException) {
          switch (error.code) {
            case 'invalid-email':
              networkExceptions = const NetworkExceptions.unauthorizedRequest(
                'Invalid email',
                true,
              );
              break;
            case 'wrong-password':
              networkExceptions = const NetworkExceptions.unauthorizedRequest(
                'Wrong password',
                true,
              );
              break;
            case 'user-not-found':
              networkExceptions = const NetworkExceptions.unauthorizedRequest(
                'User not found',
                true,
              );
              break;
            case 'user-disabled':
              networkExceptions = const NetworkExceptions.unauthorizedRequest(
                'User disabled',
                true,
              );
              break;
            case 'too-many-requests':
              networkExceptions = const NetworkExceptions.unauthorizedRequest(
                'Too many requests',
                true,
              );
              break;
            case 'operation-not-allowed':
              networkExceptions = const NetworkExceptions.unauthorizedRequest(
                'Operation not allowed',
                true,
              );
              break;
            case 'email-already-in-use':
              networkExceptions = const NetworkExceptions.unauthorizedRequest(
                'Email already in use',
                true,
              );
              break;
            case 'weak-password':
              networkExceptions = const NetworkExceptions.unauthorizedRequest(
                'Weak password',
                true,
              );
              break;
            case 'invalid-credential':
              networkExceptions = const NetworkExceptions.unauthorizedRequest(
                'Invalid credential',
                true,
              );
              break;
            case 'permission-denied':
              networkExceptions = const NetworkExceptions.unauthorizedRequest(
                'Permission denied',
                true,
              );
              break;
            case 'unavailable':
              networkExceptions = const NetworkExceptions.serviceUnavailable();
              break;
            case 'internal':
              networkExceptions = const NetworkExceptions.internalServerError('Internal');
              break;
            case 'not-found':
              networkExceptions = const NetworkExceptions.notFound('Not found');
              break;
            case 'unauthenticated':
              networkExceptions = const NetworkExceptions.unauthorizedRequest(
                'Unauthenticated',
                true,
              );
              break;
            default:
              networkExceptions = const NetworkExceptions.unexpectedError();
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions error) {
    var errorMessage = "";
    error.when(
      notImplemented: () {
        errorMessage = "Not Implemented";
      },
      requestCancelled: () {
        errorMessage = "Request Cancelled";
      },
      internalServerError: (String reason) {
        errorMessage = reason;
      },
      notFound: (String reason) {
        errorMessage = reason;
      },
      serviceUnavailable: () {
        errorMessage = "Gagal Memuat";
      },
      methodNotAllowed: () {
        errorMessage = "Method Allowed";
      },
      badRequest: () {
        errorMessage = "Bad request";
      },
      unauthorizedRequest: (String error, bool isUnauthorizedRequest) {
        errorMessage = error;
      },
      unexpectedError: () {
        errorMessage = "Unexpected error occurred";
      },
      requestTimeout: () {
        errorMessage = "Connection request timeout";
      },
      noInternetConnection: () {
        errorMessage = "No internet connection";
      },
      conflict: () {
        errorMessage = "Error due to a conflict";
      },
      sendTimeout: () {
        errorMessage = "Send timeout in connection with API server";
      },
      unableToProcess: () {
        errorMessage = "Unable to process the data";
      },
      defaultError: (String error) {
        errorMessage = error;
      },
      formatException: () {
        errorMessage = "Unexpected error occurred";
      },
      notAcceptable: () {
        errorMessage = "Not acceptable";
      },
      unProcessableEntity: (errors, error) {
        errorMessage = error;
      },
    );
    return errorMessage;
  }

  static Map<String, dynamic> getErrors(NetworkExceptions exceptions) {
    return exceptions.maybeWhen(
      unProcessableEntity: (error, message) {
        return error;
      },
      orElse: () {
        return {};
      },
    );
  }
}
