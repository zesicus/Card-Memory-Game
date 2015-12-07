# Card-Memory-Game
Turn over cards get points

Rules
---------------------
1. Turn over one card cost 1 point.
2. Rewards: If the card you turned over the suit matchs the previous one, then you get 4 point; if digits match, you get 16 points!
3. Punishment: If none of suits and digits match, then reduce 2 points.

Interface
---------------------
Didn't provide a external interface for rewards,  punishment multiple, initial cost value and etc.But you can modify them in files.

To modify initial score in: "model/playingCard.m"
-(int)match:(NSArray *)otherCards
change value of the "int score = 0" to be what you like. 

To modify the multiple of rewards and punishment go to "model/playing"
Which you wanna modify the multiple following:
	static const int MATCH_BONUS = 4;//Rewards multiple
	static const int MISMATCH_PENALTY = 2;//punish multiple
	static const int COST_TO_CHOOSE = 1;//points cost to turn over one card

