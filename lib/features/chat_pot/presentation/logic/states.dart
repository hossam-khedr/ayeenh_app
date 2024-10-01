enum BotStatus { init, botSendMassageSuccess, userSendMassageSuccess,loading }

extension BotState on BotStates {
  bool get isInitial => botStatus == BotStatus.init;
  bool get isLoading => botStatus == BotStatus.loading;

  bool get isBotSendMassageSuccess => botStatus == BotStatus.botSendMassageSuccess;

  bool get isUserSendMassageSuccess => botStatus == BotStatus.userSendMassageSuccess;
}

class BotStates {
  BotStatus botStatus;

  BotStates({
    this.botStatus = BotStatus.init,
  });

  BotStates copyWith({BotStatus? botStatus}) {
    return BotStates(
      botStatus: botStatus ?? this.botStatus,
    );
  }
}
